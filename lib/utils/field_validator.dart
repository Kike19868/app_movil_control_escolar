class FieldValidator {

  static bool validateCurp(String curp) {
    var re = RegExp(
      r"^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$",
      caseSensitive: false,
      multiLine: false,
    );
    var validado = re.allMatches(curp);
    var matches = validado.toList();

    if (matches.isEmpty) {
      return false;
    }

    return true;
  }

  static bool validateEmail(String email) {
    var re = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",caseSensitive: false,multiLine: false);
    var validado = re.allMatches(email);
    var matches = validado.toList();

    if (matches.isEmpty) {
      return false;
    }

    return true;
  }

  static bool validateMotivoConst(bool? m1, bool? m2, bool? m3, bool? m4, bool? m5, bool? m6){
    if(m1==false && m2==false && m3==false && m4==false && m5==false && m6==false){
      return false;
    }
    return true;
  }

  static bool validateMotivoHistAc(bool? m1, bool? m2, bool? m3, bool? m4, bool? m5, bool? m6){
    if(m1==false && m2==false && m3==false && m4==false && m5==false && m6==false){
      return false;
    }
    return true;
  }
}
