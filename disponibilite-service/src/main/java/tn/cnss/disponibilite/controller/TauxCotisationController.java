package tn.cnss.disponibilite.controller;

import org.springframework.web.bind.annotation.*;
import tn.cnss.disponibilite.entity.TauxCotisation;
import tn.cnss.disponibilite.service.TauxCotisationService;

import java.util.List;

@RestController
@RequestMapping("/api/disponibilite/taux")
public class TauxCotisationController {

    private final TauxCotisationService service;

    public TauxCotisationController(TauxCotisationService service) {
        this.service = service;
    }

    @GetMapping
    public List<TauxCotisation> findAll() {
        return service.getAll();
    }
}
