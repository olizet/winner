package pl.app.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.entity.Analysis;
import pl.app.entity.Comment;
import pl.app.entity.User;
import pl.app.repository.AnalysisRepository;
import pl.app.repository.CommentRepository;
import pl.app.repository.UserRepository;

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
    public String addUser(@Valid User user, BindingResult result, HttpSession session){
    if(result.hasErrors()){
        return "user/addForm";
    }
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
        for(User user:userRepository.findAll()){
            if(user.getEmail().equals(email)) {
                logged = user;
                if (BCrypt.checkpw(password, logged.getPassword())) {
                    model.addAttribute("user",user);
                    session.setAttribute("email", user.getEmail());
                    String referer = request.getHeader("Referer");
                    return "redirect:"+ referer;
                } else {
                    return "redirect:/";
                }
            } else {
                return "redirect:/";
            }
        } return "redirect:/";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request,HttpSession session){
        session.removeAttribute("email");
        String referer = request.getHeader("Referer");
        return "redirect:"+ referer;
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
