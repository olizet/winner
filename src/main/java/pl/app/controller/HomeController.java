package pl.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.app.entity.Analysis;
import pl.app.entity.User;
import pl.app.repository.AnalysisRepository;
import pl.app.repository.UserRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    AnalysisRepository analysisRepository;

    @RequestMapping("/")
    public String showHomePage(HttpSession session, Model model){
        String email = (String) session.getAttribute("email");
        if (email != null) {
            User user = userRepository.findFirstByEmail(email);
            model.addAttribute("user", user);
        }
        return "index";
    }
    @ModelAttribute("freshAnalyses")
    public List<Analysis> getFreshAnalyses(){
        List <Analysis> freshAnalyses = analysisRepository.getFresh();
        return freshAnalyses;
    }

}
