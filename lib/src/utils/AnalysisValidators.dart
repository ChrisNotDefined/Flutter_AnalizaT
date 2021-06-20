String isCalcHematies(int hematies) {
  if (hematies >= 4) {
    if (hematies <= 6) {
      return 'Tu nivel de Hematies es adecuado';
    } else {
      return 'Tu nivel de Hematies es alto';
    }
  } else {
    return 'Tu nivel de Hematies es bajo';
  }
}

String isCalcHemoglobina(int hemoglobina) {
  if (hemoglobina >= 12) {
    if (hemoglobina <= 16) {
      return 'Tu nivel de Hemoglobina es adecuado';
    } else {
      return 'Tu nivel de Hemoglobina es alto';
    }
  } else {
    return 'Tu nivel de Hemoglobina es bajo';
  }
}

String isCalcHematocrito(int hematocrito) {
  if (hematocrito >= 36) {
    if (hematocrito <= 53) {
      return 'Tu nivel de Hematocrito es adecuado';
    } else {
      return 'Tu nivel de Hematocrito es alto';
    }
  } else {
    return 'Tu nivel de Hematocrito es bajo';
  }
}

String isCalcVCM(int vcm) {
  if (vcm >= 88) {
    if (vcm <= 100) {
      return 'Tu nivel de VCM es adecuado';
    } else {
      return 'Tu nivel de VCM es alto';
    }
  } else {
    return 'Tu nivel de VCM es bajo';
  }
}

String isCalcHCM(int hcm) {
  if (hcm >= 27) {
    if (hcm <= 33) {
      return 'Tu nivel de HCM es adecuado';
    } else {
      return 'Tu nivel de HCM es alto';
    }
  } else {
    return 'Tu nivel de HCM es bajo';
  }
}

String isCalcLinfocitos(int linfocitos) {
  if (linfocitos >= 1300) {
    if (linfocitos <= 4000) {
      return 'Tu nivel de Linfocitos es adecuado';
    } else {
      return 'Tu nivel de Linfocitos es alto';
    }
  } else {
    return 'Tu nivel de Linfocitos es bajo';
  }
}

String isCalcNeutrofilos(int neutrofilos) {
  if (neutrofilos >= 2000) {
    if (neutrofilos <= 7500) {
      return 'Tu nivel de Neutrofilos es adecuado';
    } else {
      return 'Tu nivel de Neutrofilos es alto';
    }
  } else {
    return 'Tu nivel de Neutrofilos es bajo';
  }
}

String isCalcEosinofilos(int eosinofilos) {
  if (eosinofilos >= 50) {
    if (eosinofilos <= 500) {
      return 'Tu nivel de Eosinofilos es adecuado';
    } else {
      return 'Tu nivel de Eosinofilos es alto';
    }
  } else {
    return 'Tu nivel de Eosinofilos es bajo';
  }
}

String isCalcPlaquetas(int plaquetas) {
  if (plaquetas >= 150000) {
    if (plaquetas <= 400000) {
      return 'Tu nivel de Plaquetas es adecuado';
    } else {
      return 'Tu nivel de Plaquetas es alto';
    }
  } else {
    return 'Tu nivel de Plaquetas es bajo';
  }
}

String isCalcVSG(int vsg) {
  if (vsg >= 0) {
    if (vsg <= 20) {
      return 'Tu nivel de VSG es adecuado';
    } else {
      return 'Tu nivel de VSG es alto';
    }
  } else {
    return 'Tu nivel de VSG es bajo';
  }
}

String isCalcGlucosa(int glucosa) {
  if (glucosa >= 70) {
    if (glucosa <= 110) {
      return 'Tu nivel de Glucosa es adecuado';
    } else {
      return 'Tu nivel de Glucosa es alto';
    }
  } else {
    return 'Tu nivel de Glucosa es bajo';
  }
}

String isCalcUrea(double urea) {
  if (urea >= 1) {
    if (urea <= 1.5) {
      return 'Tu nivel de Urea es adecuado';
    } else {
      return 'Tu nivel de Urea es alto';
    }
  } else {
    return 'Tu nivel de Urea es bajo';
  }
}

String isCalcAcidoUrico(int acidoUrico) {
  if (acidoUrico >= 2) {
    if (acidoUrico <= 7) {
      return 'Tu nivel de Acido Urico es adecuado';
    } else {
      return 'Tu nivel de Acido Urico es alto';
    }
  } else {
    return 'Tu nivel de Acido Urico es bajo';
  }
}

String isCalcCreatinina(int creatinina) {
  if (creatinina >= 70) {
    if (creatinina <= 110) {
      return 'Tu nivel de Creatinina es adecuado';
    } else {
      return 'Tu nivel de Creatinina es alto';
    }
  } else {
    return 'Tu nivel de Creatinina es bajo';
  }
}

String isCalcColesterol(int colesterol) {
  if (colesterol >= 120) {
    if (colesterol <= 200) {
      return 'Tu nivel de Colesterol es adecuado';
    } else {
      return 'Tu nivel de Colesterol es alto';
    }
  } else {
    return 'Tu nivel de Colesterol es bajo';
  }
}

String isCalcTrigliceridos(int trigliceridos) {
  if (trigliceridos >= 30) {
    if (trigliceridos <= 200) {
      return 'Tu nivel de Trigliceridos es adecuado';
    } else {
      return 'Tu nivel de Trigliceridos es alto';
    }
  } else {
    return 'Tu nivel de Trigliceridos es bajo';
  }
}

String isCalcTransaminasas(int transaminasas) {
  if (transaminasas >= 7) {
    if (transaminasas <= 40) {
      return 'Tu nivel de Transaminasas es adecuado';
    } else {
      return 'Tu nivel de Transaminasas es alto';
    }
  } else {
    return 'Tu nivel de Transaminasas es bajo';
  }
}

String isCalcFosfataAlcalina(int fosfataAlcalina) {
  if (fosfataAlcalina >= 89) {
    if (fosfataAlcalina <= 280) {
      return 'Tu nivel de Fosfata Alcalina es adecuado';
    } else {
      return 'Tu nivel de Fosfata Alcalina es alto';
    }
  } else {
    return 'Tu nivel de Fosfata Alcalina es bajo';
  }
}

String isCalcCalcio(int calcio) {
  if (calcio >= 9) {
    if (calcio <= 11) {
      return 'Tu nivel de Calcio es adecuado';
    } else {
      return 'Tu nivel de Calcio es alto';
    }
  } else {
    return 'Tu nivel de Calcio es bajo';
  }
}

String isCalcHierro(int hierro) {
  if (hierro >= 50) {
    if (hierro <= 150) {
      return 'Tu nivel de Hierro es adecuado';
    } else {
      return 'Tu nivel de Hierro es alto';
    }
  } else {
    return 'Tu nivel de Hierro es bajo';
  }
}

String isCalcPotasio(int potasio) {
  if (potasio >= 4) {
    if (potasio <= 5) {
      return 'Tu nivel de Potasio es adecuado';
    } else {
      return 'Tu nivel de Potasio es alto';
    }
  } else {
    return 'Tu nivel de Potasio es bajo';
  }
}

String isCalcSodio(int sodio) {
  if (sodio >= 135) {
    if (sodio <= 145) {
      return 'Tu nivel de Sodio es adecuado';
    } else {
      return 'Tu nivel de Sodio es alto';
    }
  } else {
    return 'Tu nivel de Sodio es bajo';
  }
}

String isCalcBilirrubina(int bilirrubina) {
  if (bilirrubina >= 0) {
    if (bilirrubina <= 1) {
      return 'Tu nivel de Bilirrubina es adecuado';
    } else {
      return 'Tu nivel de Bilirrubina es alto';
    }
  } else {
    return 'Tu nivel de Bilirrubina es bajo';
  }
}
