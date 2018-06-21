package pl.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
@RequestMapping("/analysis")
public class AnalysisController {
    @Autowired
    AnalysisRepository analysisRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CommentRepository commentRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String showList(@RequestParam(required = false) String search, Model model,HttpSession session){
        List<Analysis> analyses =  analysisRepository.getTopAnalysis(search);
        model.addAttribute("analyses",analyses);
        return "analysis/list";
    }
    @ModelAttribute("freshAnalyses")
    public List<Analysis> getFreshAnalyses(){
        List <Analysis> freshAnalyses = analysisRepository.getFresh();
        return freshAnalyses;
    }

    @RequestMapping(value="/add",method = RequestMethod.POST)
    public String addCamp(@Valid Analysis analysis, BindingResult result, Model model, HttpSession session){
        if(result.hasErrors()){
            return "analysis/addForm";
        }
        User user = getLogger(session);
        analysis.setOwner(user);
        analysisRepository.save(analysis);
        return "redirect:/user/details";
    }
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String showForm(@RequestParam(required = false) Long id, HttpSession session, Model model){
        if(analysisRepository.findAnalysisById(id)!=null){
            Analysis analysis = analysisRepository.findAnalysisById(id);
            model.addAttribute("analysis",analysis);
        }else {
            model.addAttribute("analysis",new Analysis());
        }
        return "analysis/addForm";
    }
    @RequestMapping(value="/delete",method = RequestMethod.GET)
    public String deleteAnalysis(@RequestParam Long id){
        analysisRepository.delete(id);
        return "redirect:../user/details";
    }

    @ModelAttribute("user")
    public User getLogger(HttpSession session){
        String email = (String) session.getAttribute("email");
        User user = userRepository.findFirstByEmail(email);
        return user;
    }
    @RequestMapping(value="/{analysisId}",method = RequestMethod.GET)
    public String showDetails(@PathVariable Long analysisId,@RequestParam(required = false) Long commentId, Model model,HttpSession session){
        Analysis analysis = analysisRepository.findAnalysisById(analysisId);
        model.addAttribute("analysis",analysis);
        List<Comment> comments = commentRepository.findCommentsByAnalysis(analysis);
        model.addAttribute("commentsByAnalysis",comments);
        if(commentId!=null){
            Comment comment = commentRepository.findCommentById(commentId);
            model.addAttribute("comment",comment);
        }else{
            model.addAttribute("comment",new Comment());
        }

        return "/analysis/details";
    }
}
