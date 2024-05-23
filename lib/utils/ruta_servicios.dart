class RutaServicios{
  static String server = "https://sigece.prepaenlinea.sep.gob.mx/ce-api/";
  //static String server = "http://10.0.2.2:8080/ce-api/";

  //Consultar temas
  static String aspTopicsService="topics/aspTopics";
  static String estTopicsService="topics/estTopics";
  static String egreTopicsService="topics/egreTopics";

  //Crear tickets aspirantes
  static String aspGralService="ticket/aspGral";

  //Crear tickets estudiantes
  static String estBecaService="ticket/estBeca";
  static String estBTempService="ticket/estBTemp";
  static String estCertParService="ticket/estCertPar";
  static String estConstService="ticket/estConst";
  static String estFelicService="ticket/estFelic";
  static String estGral2Service="ticket/estGral2";
  static String estGralService="ticket/estGral";
  static String estHistAcService="ticket/estHistAc";
  static String estImssService="ticket/estImss";
  static String estModSimService="ticket/estModSim";
  static String estProbAulService="ticket/estProbAul";
  static String estReinBTService="ticket/estReinBT";

  //Crear tickets egresados
  static String egrAsesService="ticket/egrAses";
  static String egrCorrService="ticket/egrCorr";

  //Consultar estatus ticket
  static String consultaService="ticket/consultar";
}