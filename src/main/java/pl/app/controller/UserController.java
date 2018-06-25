package pl.app.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.app.entity.Analysis;
import pl.app.entity.Comment;
import pl.app.entity.User;
import pl.app.service.GenerateMail;
import pl.app.repository.AnalysisRepository;
import pl.app.repository.CommentRepository;
import pl.app.repository.UserRepository;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    AnalysisRepository  analysisRepository;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String showFrom(Model model,HttpSession session){
        if(session.getAttribute("email")!=null){
            String email = (String) session.getAttribute("email");
            User user = userRepository.findFirstByEmail(email);
            model.addAttribute("user",user);
        } else {
            model.addAttribute("user",new User());
        }
        return "user/addForm";
    }

    @RequestMapping(value="/",method = RequestMethod.POST)
    public String addUser(@Valid User user, BindingResult result, HttpSession session) throws MessagingException {
    if(result.hasErrors()){
        return "user/addForm";
    }
        User existingUser = userRepository.findFirstByEmail(user.getEmail());
        if (existingUser != null) {
            FieldError error = new FieldError("user", "email", "Email musi być unikalny");
            result.addError(error);
            return "user/addForm";
        }
    GenerateMail.generateAndSendEmail(user.getEmail());
    session.setAttribute("email",user.getEmail());
    userRepository.save(user);
    return "redirect:/";
    }
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(){
        return "user/login";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String isLogged(HttpServletRequest request, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session){
        User logged = null;
        User existingUser = userRepository.findFirstByEmail(email);
                if (existingUser!=null &&BCrypt.checkpw(password, existingUser.getPassword())){
                    model.addAttribute("user",existingUser);
                    session.setAttribute("email", existingUser.getEmail());
                    String referer = request.getHeader("Referer");
                    return "redirect:"+ referer;
                } else {
                    model.addAttribute("loginError", "Incorrect Login or password");
                }
         return "redirect:/";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("email");
        return "redirect:/";
    }
    @RequestMapping(value="/details",method = RequestMethod.GET)
    public String showProfile(HttpSession session,Model model){
        String email = (String) session.getAttribute("email");
        User user = userRepository.findFirstByEmail(email);
        List<Comment> addedComments = commentRepository.findCommentsByUser(user);
        List<Analysis> addedAnalyses = analysisRepository.findAnalysesByOwner(user);
        model.addAttribute("addedComments",addedComments);
        model.addAttribute("addedAnalyses",addedAnalyses);
        model.addAttribute("user",user);
        return "user/profileDetails";
    }
}
