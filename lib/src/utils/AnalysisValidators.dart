String isCalcGlobulosRojos(double globulosRojos) {
  if (globulosRojos >= 4) {
    if (globulosRojos <= 6) {
      return 'Tu nivel de Globulos Rojos es adecuado';
    } else {
      return 'Tu nivel de Globulos Rojos es alto';
    }
  } else {
    return 'Tu nivel de Globulos Rojos es bajo';
  }
}

String isCalcGlobulosBlancos(double globulosBlancos) {
  if (globulosBlancos >= 45000) {
    if (globulosBlancos <= 11000) {
      return 'Tu nivel de Globulos Blancos es adecuado';
    } else {
      return 'Tu nivel de Globulos Blancos es alto';
    }
  } else {
    return 'Tu nivel de Globulos Blancos es bajo';
  }
}

String isCalcTrigliceridos(double trigliceridos) {
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

String isCalcHemoglobina(double hemoglobina) {
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

String isCalcPlaquetas(double plaquetas) {
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

String isCalcGlucosa(double glucosa) {
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

String isCalcAcidoUrico(double acidoUrico) {
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

String isCalcColesterolHDL(double hdl) {
  if (hdl >= 40) {
    if (hdl <= 60) {
      return 'Tu nivel de HDL es adecuado';
    } else {
      return 'Tu nivel de HDL es alto';
    }
  } else {
    return 'Tu nivel de HDL es bajo';
  }
}

String isCalcColesterolLDL(double ldl) {
  if (ldl >= 70) {
    if (ldl <= 130) {
      return 'Tu nivel de LDL es adecuado';
    } else {
      return 'Tu nivel de LDL es alto';
    }
  } else {
    return 'Tu nivel de LDL es bajo';
  }
}
