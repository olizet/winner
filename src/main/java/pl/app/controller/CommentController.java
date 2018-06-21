package pl.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.app.entity.Analysis;
import pl.app.entity.Comment;
import pl.app.entity.User;
import pl.app.repository.AnalysisRepository;
import pl.app.repository.CommentRepository;
import pl.app.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    UserRepository  userRepository;
    @Autowired
    AnalysisRepository analysisRepository;
    @Autowired
    CommentRepository commentRepository;
    @RequestMapping(value = "analysis/{id}/addComment", method = RequestMethod.GET)
    public String showFom(@PathVariable Long id, Model model){
        model.addAttribute("comment",new Comment());
    return "comment/addForm";
    }

    @ModelAttribute("user")
    public User getLogger(HttpSession session){
        String email = (String) session.getAttribute("email");
        User user = userRepository.findFirstByEmail(email);
        return user;
    }
    @RequestMapping(value="analysis/{id}/addComment",method = RequestMethod.POST)
    public String addComment(@PathVariable Long id, @Valid Comment comment, BindingResult result, HttpSession session){
        if(result.hasErrors()){
            return "comment/addForm";
        }
        User user = getLogger(session);
        comment.setUser(user);
        Analysis analysis = analysisRepository.findAnalysisById(id);
        comment.setAnalysis(analysis);
        commentRepository.save(comment);
        Double avg = commentRepository.getAvgRatingCamp(id);
        analysis.setRating(avg);
        analysisRepository.save(analysis);
        return "redirect:/analysis/"+id;
    }
    @ModelAttribute("ratings")
    public List<Double> getRatings(){
        List<Double> ratings = new ArrayList<>();
        for(Double i=0.0;i<5.5;i+=0.5){
            ratings.add(i);
        }
        return ratings;
    }

}
