INSERT INTO ADMIN(ID, UsuarioID) VALUES (?, ?);
INSERT INTO CARACTER(ID, Name) VALUES (?, ?);
INSERT INTO CURSO(ID, Nombre, Sigla, Descripcion) VALUES (?, ?, ?, ?);
INSERT INTO ESTADO_TUTORIA(ID, Nombre) VALUES (?, ?);
INSERT INTO ESTUDIANTE(UsuarioID, ID) VALUES (?, ?);
INSERT INTO EVALUACION(ID, ParticipacionTutor, EvaluacionGeneral, PartipacionTutorando, PuntosAgendaAbarcados, Completitud, Practica, Foro) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO FECHA(Fecha_Inicio, Fecha_Fin, TutorID, Available) VALUES (?, ?, ?, ?);
INSERT INTO INGRESO(Monto, TUTORID, Fecha_deposito, ID) VALUES (?, ?, ?, ?);
INSERT INTO MATERIALES(Path, TUTORIAID, ID, UsuarioID, CURSOID) VALUES (?, ?, ?, ?, ?);
INSERT INTO MENSAJE(Contenido, Fecha, ID, Remitente, Receptor) VALUES (?, ?, ?, ?, ?);
INSERT INTO MODALIDAD(ID, Nombre) VALUES (?, ?);
INSERT INTO MODALIDAD_TUTOR(MODALIDADID, TUTORID) VALUES (?, ?);
INSERT INTO PLATAFORMA(ID, Nombre) VALUES (?, ?);
INSERT INTO REGION(Nombre, ID) VALUES (?, ?);
INSERT INTO RETRIBUCION(Tipo, ID) VALUES (?, ?);
INSERT INTO TIPO_SESION(ID, Nombre) VALUES (?, ?);
INSERT INTO TIPO_SESION_TUTOR(TIPO_SESIONID, TUTORID) VALUES (?, ?);
INSERT INTO TUTOR(ID, Calificacion, CantidadTutoriasAgendadas, CantidadMinutosAgendados, RetritubucionID, UsuarioID, CostoHoraPersona, IncrementoTarifaIndividual, CostoHoraGrupal, IncrementoTarifaGrupal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO TUTOR_CURSO(TutorID, CursoID, Ano, Periodo, ID) VALUES (?, ?, ?, ?, ?);
INSERT INTO TUTORIA(ID, FechaInicial, FechaFinal, RetribucionID, MaxEstudiantes, TutorCursoID, EstadoTutoriaID, PlataformaID, DetallesPlataforma, CaracterID, MODALIDADID, TIPO_SESIONID, DescripcionRetribucion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO TUTORIA_ESTUDIANTE(TutoriaID, TutoriaEstudianteID, HoraIngreso, HoraEgreso, EvaluacionID, EstudianteID) VALUES (?, ?, ?, ?, ?, ?);
INSERT INTO USUARIO(Correo, Contrasena, Apellido, PrimerNombre, ID, REGION) VALUES (?, ?, ?, ?, ?, ?);

use pi

INSERT INTO REGION(Nombre) VALUES ('CARTAGO');
INSERT INTO REGION(Nombre) VALUES ('SAN JOSE');
INSERT INTO REGION(Nombre) VALUES ('GUANACASTE');
INSERT INTO REGION(Nombre) VALUES ('HEREDIA');
INSERT INTO REGION(Nombre) VALUES ('LIMÓN');
INSERT INTO REGION(Nombre) VALUES ('SAN JOSÉ');
INSERT INTO REGION(Nombre) VALUES ('PUNTARENAS');


SELECT * FROM REGION
select * from curso
select * from tutor
select * from usuario
select * from estudiante
SELECT * FROM TUTOR_CURSO

EXEC GetAvailableCourses @pattern = '%PROGRA%'

delete from estudiante where [ID] = 6
delete from [usuario] where usuario.id = 11

select * from TUTOR_CURSO

INSERT INTO TUTOR_CURSO(TutorID, CursoID, Ano, Periodo) VALUES (5, 4, 2021, 1);
INSERT INTO TUTOR_CURSO(TutorID, CursoID, Ano, Periodo) VALUES (5, 6, 2021, 1);

update CURSO
set Descripcion = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus e'



SELECT * 
  FROM PI.INFORMATION_SCHEMA.ROUTINES
 WHERE ROUTINE_TYPE = 'PROCEDURE'


--INSERT ESTADO_TUTORIA
insert into estado_tutoria (nombre) values('Pendiente');
insert into estado_tutoria (nombre) values('Aceptada');
insert into estado_tutoria (nombre) values('Rechazada');
insert into estado_tutoria (nombre) values('Finalizada');

select * from ESTADO_TUTORIA
delete from ESTADO_TUTORIA
EXEC GET_TUTOR @ID=39


--INSERT PLATAFORMA
insert into plataforma (nombre) values('Presencial')
insert into plataforma (nombre) values('Zoom')

--INSERT CARACTER
insert into caracter (name) values('Cerrada')
insert into caracter (name) values('Abierta')


--INSERT MODALIDAD
INSERT INTO MODALIDAD(NOMBRE) VALUES('Presencial')
INSERT INTO MODALIDAD(NOMBRE) VALUES('Virtual')

--INSERT TIPOSESION
INSERT INTO TIPO_SESION(Nombre) VALUES('Individual')
INSERT INTO TIPO_SESION(Nombre) VALUES('Grupal')


--RETRIBUCION

INSERT INTO RETRIBUCION(Tipo) VALUES('SINPE')
INSERT INTO RETRIBUCION(Tipo) VALUES('Horas Asistentes')
INSERT INTO RETRIBUCION(Tipo) VALUES('Horas Estudiante')
INSERT INTO RETRIBUCION(Tipo) VALUES('TCU')
INSERT INTO RETRIBUCION(Tipo) VALUES('free')
INSERT INTO RETRIBUCION(Tipo) VALUES('Patrocinio Privado')

--CURSOS
INSERT INTO CURSO(Nombre, Sigla, Descripcion) VALUES ('PROGRAMACION', 'CI0131' , 'Java, POO, herencia, manejo de archivos')
INSERT INTO CURSO(Nombre, Sigla, Descripcion) VALUES ('ALEGRA', 'CI0132' , 'Transformaciones lineales')
INSERT INTO CURSO(Nombre, Sigla, Descripcion) VALUES ('PROGRAMACION PARALELA', 'CI0133' , 'C++, Linux, Fork, Threads, Semáforos')

--PLATAFORMA
INSERT INTO PLATAFORMA(Nombre) VALUES('Presencial')
INSERT INTO PLATAFORMA(Nombre) VALUES('Zoom')
INSERT INTO PLATAFORMA(Nombre) VALUES('Skype')
INSERT INTO PLATAFORMA(Nombre) VALUES('Google Meets')


SELECT ROUTINE_NAME, ROUTINE_DEFINITION
FROM PI.INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'




SELECT 
T.ID [TutoriaId],
T.FechaInicial [TutoriaFechaInicial],
T.FechaFinal [TutoriaFechaFinal],
T.CantidadEstudiantes [TutoriaCantidadEstudiantes],
R.ID AS [RetribucionId],
R.Tipo AS [RetribucionTipo], 
TC.CursoID [TutorCursoId], 
TC.Ano [TutorCursoAno], 
TC.Periodo [TutorCursoPeriodo], 
CU.ID [CursoId],
CU.Nombre [CursoNombre],
CU.Sigla [CursoSigla],
CU.Descripcion [CursoDescripcion],
TU.ID AS [TutorId],
US.ID AS [TutorUsuarioId],
US.PrimerNombre [TutorPrimerNombre],
US.Apellido [TutorApellido],
US.Correo [TutorCorreo],
US.REGION [TutorRegion],
ET.ID [EstadoTutoriaId],
ET.Nombre AS [EstadoTutoriaNombre],
--P.Nombre AS [PlataformaNombre],
C.ID [CaracterId],
C.Name AS [CaracterNombre],
M.ID [ModalidadId],
M.Nombre as [ModalidadNombre],
TS.ID [TipoSesionId],
TS.Nombre AS [TipoSesionNombre]
FROM TUTORIA T
JOIN RETRIBUCION R
ON T.RetribucionID = R.ID
JOIN TUTOR_CURSO TC
ON T.TutorCursoID = TC.ID
JOIN ESTADO_TUTORIA ET
ON T.EstadoTutoriaID = ET.ID
--JOIN PLATAFORMA P
--ON T.PlataformaID = P.ID
JOIN CARACTER C
ON T.CaracterID = C.ID
JOIN MODALIDAD M
ON T.MODALIDADID = M.ID
JOIN TIPO_SESION TS
ON T.TIPO_SESIONID = TS.ID
JOIN CURSO CU
ON TC.CursoID = CU.ID
JOIN TUTOR TU
ON TC.TutorID = TU.ID
JOIN USUARIO US
ON TU.UsuarioID = US.ID
WHERE T.ID = 68