PGDMP  2    $    	            }         
   BD_Mumanal    16.7    16.7 Y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24577 
   BD_Mumanal    DATABASE     r   CREATE DATABASE "BD_Mumanal" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';
    DROP DATABASE "BD_Mumanal";
                gguzman    false                        2615    24578    siacor    SCHEMA        CREATE SCHEMA siacor;
    DROP SCHEMA siacor;
                gguzman    false            �           0    0    SCHEMA siacor    COMMENT     G   COMMENT ON SCHEMA siacor IS 'Sistema Automatizado de Correspondencia';
                   gguzman    false    6            �            1259    24579    parametrica    TABLE     �  CREATE TABLE public.parametrica (
    id_parametrica integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(20) NOT NULL,
    valor_texto text,
    valor_numerico numeric,
    valor_booleano boolean,
    valor_fecha date,
    activo boolean DEFAULT true,
    fecha_creacion timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone DEFAULT now()
);
    DROP TABLE public.parametrica;
       public         heap    gguzman    false            �            1259    24587    parametrica_idparametrica_seq    SEQUENCE     �   CREATE SEQUENCE public.parametrica_idparametrica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.parametrica_idparametrica_seq;
       public          gguzman    false    216            �           0    0    parametrica_idparametrica_seq    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.parametrica_idparametrica_seq OWNED BY public.parametrica.id_parametrica;
          public          gguzman    false    217            �            1259    32820    usr_mod_rol    TABLE     �  CREATE TABLE public.usr_mod_rol (
    id_usr_mod_rol bigint NOT NULL,
    codigo_usuario character varying(30),
    cod_rol integer,
    cod_modulo integer,
    habilitado integer DEFAULT 1,
    fecha_creacion timestamp with time zone,
    creado_por character varying(30),
    fecha_modificacion time with time zone,
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(255)
);
    DROP TABLE public.usr_mod_rol;
       public         heap    gguzman    false            �            1259    32819    usr_mod_rol_id_usr_mod_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.usr_mod_rol_id_usr_mod_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.usr_mod_rol_id_usr_mod_rol_seq;
       public          gguzman    false    235            �           0    0    usr_mod_rol_id_usr_mod_rol_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.usr_mod_rol_id_usr_mod_rol_seq OWNED BY public.usr_mod_rol.id_usr_mod_rol;
          public          gguzman    false    234            �            1259    32827    usuario    TABLE     �  CREATE TABLE public.usuario (
    codigo character varying(30) NOT NULL,
    password character varying(255),
    nombre_completo character varying(50),
    pagina_inicio integer,
    email character varying(255),
    oficina integer,
    unidad integer,
    permisos integer,
    cargo character varying(255),
    mosca character varying(255),
    nivel integer,
    genero integer,
    habilitado integer DEFAULT 1,
    fecha_creacion timestamp with time zone,
    creado_por character varying(30),
    fecha_modificacion time with time zone,
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(255)
);
    DROP TABLE public.usuario;
       public         heap    gguzman    false            �           0    0    COLUMN usuario.codigo    COMMENT     �   COMMENT ON COLUMN public.usuario.codigo IS 'Codigo del usuario generado principalmente por el primer apellido y primer nombre';
          public          gguzman    false    236            �           0    0    COLUMN usuario.password    COMMENT     i   COMMENT ON COLUMN public.usuario.password IS 'Password con el que se ingresa a los sistemas o modulos.';
          public          gguzman    false    236            �           0    0    COLUMN usuario.oficina    COMMENT     c   COMMENT ON COLUMN public.usuario.oficina IS 'Oficina o departamento al cual pertence el usuario.';
          public          gguzman    false    236            �           0    0    COLUMN usuario.cargo    COMMENT     b   COMMENT ON COLUMN public.usuario.cargo IS 'Cargo que ocpua el usuario dentro de la institucion.';
          public          gguzman    false    236            �           0    0    COLUMN usuario.mosca    COMMENT     D   COMMENT ON COLUMN public.usuario.mosca IS 'Iniciales del usuario.';
          public          gguzman    false    236            �           0    0    COLUMN usuario.nivel    COMMENT     i   COMMENT ON COLUMN public.usuario.nivel IS 'Nivel de jerarquia: 1= jefe del departamento, 0=funcionario';
          public          gguzman    false    236            �           0    0    COLUMN usuario.genero    COMMENT     B   COMMENT ON COLUMN public.usuario.genero IS 'Genero del usuario.';
          public          gguzman    false    236            �            1259    24607 
   agrupacion    TABLE       CREATE TABLE siacor.agrupacion (
    id_agru integer NOT NULL,
    nur_p character varying(50) NOT NULL,
    nur_s character varying(50) NOT NULL,
    id_seguimiento bigint,
    oficial smallint,
    esta_gru integer DEFAULT 0,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
    DROP TABLE siacor.agrupacion;
       siacor         heap    gguzman    false    6            �            1259    24613    agrupacion_idagru_seq    SEQUENCE     �   CREATE SEQUENCE siacor.agrupacion_idagru_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE siacor.agrupacion_idagru_seq;
       siacor          gguzman    false    218    6            �           0    0    agrupacion_idagru_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE siacor.agrupacion_idagru_seq OWNED BY siacor.agrupacion.id_agru;
          siacor          gguzman    false    219            �            1259    24614 
   archivados    TABLE     �  CREATE TABLE siacor.archivados (
    id_archivado bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    fecha timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL,
    persona character varying(25) NOT NULL,
    lugar character varying(100),
    observaciones text,
    copia character varying(10),
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
    DROP TABLE siacor.archivados;
       siacor         heap    gguzman    false    6            �            1259    24622    archivados_idarchivado_seq    SEQUENCE     �   CREATE SEQUENCE siacor.archivados_idarchivado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE siacor.archivados_idarchivado_seq;
       siacor          gguzman    false    6    220            �           0    0    archivados_idarchivado_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE siacor.archivados_idarchivado_seq OWNED BY siacor.archivados.id_archivado;
          siacor          gguzman    false    221            �            1259    24623    correlativos    TABLE       CREATE TABLE siacor.correlativos (
    id_cor integer NOT NULL,
    codigo character varying(30) NOT NULL,
    correlativo integer DEFAULT 0 NOT NULL,
    gestion integer DEFAULT 0 NOT NULL,
    oficina character varying(10) NOT NULL,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
     DROP TABLE siacor.correlativos;
       siacor         heap    gguzman    false    6            �            1259    32768    correlativos_asignados    TABLE     �   CREATE TABLE siacor.correlativos_asignados (
    codigo character varying(30) NOT NULL,
    persona character varying(30),
    fecha timestamp without time zone
);
 *   DROP TABLE siacor.correlativos_asignados;
       siacor         heap    gguzman    false    6            �            1259    24630    correlativos_idcor_seq    SEQUENCE     �   CREATE SEQUENCE siacor.correlativos_idcor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE siacor.correlativos_idcor_seq;
       siacor          gguzman    false    6    222            �           0    0    correlativos_idcor_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE siacor.correlativos_idcor_seq OWNED BY siacor.correlativos.id_cor;
          siacor          gguzman    false    223            �            1259    24631    descripcion_documentos    TABLE     e  CREATE TABLE siacor.descripcion_documentos (
    id_descriptor bigint NOT NULL,
    codigo character varying(50) NOT NULL,
    grupo_remitente character varying(255),
    motivo character varying(100),
    proceso character varying(100),
    prioridad smallint,
    tipo_documento character varying(100),
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
 *   DROP TABLE siacor.descripcion_documentos;
       siacor         heap    gguzman    false    6            �            1259    24638 &   descripciondocumentos_iddescriptor_seq    SEQUENCE     �   CREATE SEQUENCE siacor.descripciondocumentos_iddescriptor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE siacor.descripciondocumentos_iddescriptor_seq;
       siacor          gguzman    false    224    6            �           0    0 &   descripciondocumentos_iddescriptor_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE siacor.descripciondocumentos_iddescriptor_seq OWNED BY siacor.descripcion_documentos.id_descriptor;
          siacor          gguzman    false    225            �            1259    32773 
   documentos    TABLE       CREATE TABLE siacor.documentos (
    codigo character varying(30) NOT NULL,
    cite_original character varying(50),
    destinatario_titulo character varying(10),
    destinatario_nombres character varying(300),
    destinatario_cargo character varying(255),
    destinatario_institucion character varying(255),
    remitente_nombres character varying(255),
    remitente_cargo character varying(255),
    remitente_institucion character varying(255),
    mosca character varying(15),
    referencia text,
    contenido text,
    fecha timestamp without time zone,
    autor character varying(25),
    adjuntos character varying(255),
    copias character varying(255),
    nrohojas integer,
    tipo_documento integer,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
    DROP TABLE siacor.documentos;
       siacor         heap    gguzman    false    6            �            1259    24646 
   hojas_ruta    TABLE     �  CREATE TABLE siacor.hojas_ruta (
    nur character varying(20) NOT NULL,
    codigo character varying(30) NOT NULL,
    nro bigint DEFAULT 0 NOT NULL,
    estado integer DEFAULT 0 NOT NULL,
    fecha timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL,
    usuario character varying(50),
    proceso integer,
    viascorr smallint,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
    DROP TABLE siacor.hojas_ruta;
       siacor         heap    gguzman    false    6            �            1259    24654    listas_derivacion    TABLE     �  CREATE TABLE siacor.listas_derivacion (
    usr_origen character varying(25) NOT NULL,
    usr_destino character varying(25) NOT NULL,
    opcion integer,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
 %   DROP TABLE siacor.listas_derivacion;
       siacor         heap    gguzman    false    6            �            1259    24659    seguimientos    TABLE     �  CREATE TABLE siacor.seguimientos (
    id_seguimiento bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    derivado_por character varying(30) NOT NULL,
    derivado_a character varying(30) NOT NULL,
    f_derivacion timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone,
    f_recepcion timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone,
    estado integer DEFAULT 0,
    id_accion integer DEFAULT 0,
    observaciones text,
    padre bigint DEFAULT 0,
    oficial smallint,
    hijo character varying(50) DEFAULT '0'::character varying,
    escusa text,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
     DROP TABLE siacor.seguimientos;
       siacor         heap    gguzman    false    6            �            1259    24672    seguimientos_bkp    TABLE     �  CREATE TABLE siacor.seguimientos_bkp (
    id_seguimiento bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    derivado_por character varying(30) NOT NULL,
    derivado_a character varying(30) NOT NULL,
    f_derivacion timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone,
    f_recepcion timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone,
    estado integer DEFAULT 0,
    id_accion integer DEFAULT 0,
    observaciones text,
    padre bigint DEFAULT 0,
    oficial smallint,
    hijo character varying(50),
    escusa text,
    habilitado integer,
    fecha_creacion timestamp without time zone DEFAULT now(),
    creado_por character varying(30),
    fecha_modificacion timestamp without time zone DEFAULT now(),
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(50)
);
 $   DROP TABLE siacor.seguimientos_bkp;
       siacor         heap    gguzman    false    6            �            1259    24684 "   seguimientos_bkp_idseguimiento_seq    SEQUENCE     �   CREATE SEQUENCE siacor.seguimientos_bkp_idseguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE siacor.seguimientos_bkp_idseguimiento_seq;
       siacor          gguzman    false    6    229            �           0    0 "   seguimientos_bkp_idseguimiento_seq    SEQUENCE OWNED BY     j   ALTER SEQUENCE siacor.seguimientos_bkp_idseguimiento_seq OWNED BY siacor.seguimientos_bkp.id_seguimiento;
          siacor          gguzman    false    230            �            1259    24685    seguimientos_idseguimiento_seq    SEQUENCE     �   CREATE SEQUENCE siacor.seguimientos_idseguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE siacor.seguimientos_idseguimiento_seq;
       siacor          gguzman    false    228    6            �           0    0    seguimientos_idseguimiento_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE siacor.seguimientos_idseguimiento_seq OWNED BY siacor.seguimientos.id_seguimiento;
          siacor          gguzman    false    231            �            1259    41039    vias_id_vias_seq    SEQUENCE     y   CREATE SEQUENCE siacor.vias_id_vias_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE siacor.vias_id_vias_seq;
       siacor          gguzman    false    6            �            1259    41040    vias    TABLE     �  CREATE TABLE siacor.vias (
    id_vias integer DEFAULT nextval('siacor.vias_id_vias_seq'::regclass) NOT NULL,
    codigo_usuario character varying(30),
    codigo character varying(50),
    habilitado integer DEFAULT 1,
    fecha_creacion timestamp with time zone,
    creado_por character varying(30),
    fecha_modificacion time with time zone,
    modificado_por character varying(30),
    direccion_ip character varying(50),
    accion character varying(255)
);
    DROP TABLE siacor.vias;
       siacor         heap    gguzman    false    237    6            �           2604    24689    parametrica id_parametrica    DEFAULT     �   ALTER TABLE ONLY public.parametrica ALTER COLUMN id_parametrica SET DEFAULT nextval('public.parametrica_idparametrica_seq'::regclass);
 I   ALTER TABLE public.parametrica ALTER COLUMN id_parametrica DROP DEFAULT;
       public          gguzman    false    217    216            �           2604    32823    usr_mod_rol id_usr_mod_rol    DEFAULT     �   ALTER TABLE ONLY public.usr_mod_rol ALTER COLUMN id_usr_mod_rol SET DEFAULT nextval('public.usr_mod_rol_id_usr_mod_rol_seq'::regclass);
 I   ALTER TABLE public.usr_mod_rol ALTER COLUMN id_usr_mod_rol DROP DEFAULT;
       public          gguzman    false    234    235    235            �           2604    24693    agrupacion id_agru    DEFAULT     w   ALTER TABLE ONLY siacor.agrupacion ALTER COLUMN id_agru SET DEFAULT nextval('siacor.agrupacion_idagru_seq'::regclass);
 A   ALTER TABLE siacor.agrupacion ALTER COLUMN id_agru DROP DEFAULT;
       siacor          gguzman    false    219    218            �           2604    24694    archivados id_archivado    DEFAULT     �   ALTER TABLE ONLY siacor.archivados ALTER COLUMN id_archivado SET DEFAULT nextval('siacor.archivados_idarchivado_seq'::regclass);
 F   ALTER TABLE siacor.archivados ALTER COLUMN id_archivado DROP DEFAULT;
       siacor          gguzman    false    221    220            �           2604    24695    correlativos id_cor    DEFAULT     y   ALTER TABLE ONLY siacor.correlativos ALTER COLUMN id_cor SET DEFAULT nextval('siacor.correlativos_idcor_seq'::regclass);
 B   ALTER TABLE siacor.correlativos ALTER COLUMN id_cor DROP DEFAULT;
       siacor          gguzman    false    223    222            �           2604    24696 $   descripcion_documentos id_descriptor    DEFAULT     �   ALTER TABLE ONLY siacor.descripcion_documentos ALTER COLUMN id_descriptor SET DEFAULT nextval('siacor.descripciondocumentos_iddescriptor_seq'::regclass);
 S   ALTER TABLE siacor.descripcion_documentos ALTER COLUMN id_descriptor DROP DEFAULT;
       siacor          gguzman    false    225    224            �           2604    24697    seguimientos id_seguimiento    DEFAULT     �   ALTER TABLE ONLY siacor.seguimientos ALTER COLUMN id_seguimiento SET DEFAULT nextval('siacor.seguimientos_idseguimiento_seq'::regclass);
 J   ALTER TABLE siacor.seguimientos ALTER COLUMN id_seguimiento DROP DEFAULT;
       siacor          gguzman    false    231    228            �           2604    24698    seguimientos_bkp id_seguimiento    DEFAULT     �   ALTER TABLE ONLY siacor.seguimientos_bkp ALTER COLUMN id_seguimiento SET DEFAULT nextval('siacor.seguimientos_bkp_idseguimiento_seq'::regclass);
 N   ALTER TABLE siacor.seguimientos_bkp ALTER COLUMN id_seguimiento DROP DEFAULT;
       siacor          gguzman    false    230    229            k          0    24579    parametrica 
   TABLE DATA           �   COPY public.parametrica (id_parametrica, codigo, nombre, tipo, valor_texto, valor_numerico, valor_booleano, valor_fecha, activo, fecha_creacion, fecha_modificacion) FROM stdin;
    public          gguzman    false    216   �       ~          0    32820    usr_mod_rol 
   TABLE DATA           �   COPY public.usr_mod_rol (id_usr_mod_rol, codigo_usuario, cod_rol, cod_modulo, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    public          gguzman    false    235   ��                 0    32827    usuario 
   TABLE DATA           �   COPY public.usuario (codigo, password, nombre_completo, pagina_inicio, email, oficina, unidad, permisos, cargo, mosca, nivel, genero, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    public          gguzman    false    236   �       m          0    24607 
   agrupacion 
   TABLE DATA           �   COPY siacor.agrupacion (id_agru, nur_p, nur_s, id_seguimiento, oficial, esta_gru, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    218   .�       o          0    24614 
   archivados 
   TABLE DATA           �   COPY siacor.archivados (id_archivado, codigo, fecha, persona, lugar, observaciones, copia, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    220   K�       q          0    24623    correlativos 
   TABLE DATA           �   COPY siacor.correlativos (id_cor, codigo, correlativo, gestion, oficina, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    222   h�       {          0    32768    correlativos_asignados 
   TABLE DATA           H   COPY siacor.correlativos_asignados (codigo, persona, fecha) FROM stdin;
    siacor          gguzman    false    232   y�       s          0    24631    descripcion_documentos 
   TABLE DATA           �   COPY siacor.descripcion_documentos (id_descriptor, codigo, grupo_remitente, motivo, proceso, prioridad, tipo_documento, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    224   �       |          0    32773 
   documentos 
   TABLE DATA           �  COPY siacor.documentos (codigo, cite_original, destinatario_titulo, destinatario_nombres, destinatario_cargo, destinatario_institucion, remitente_nombres, remitente_cargo, remitente_institucion, mosca, referencia, contenido, fecha, autor, adjuntos, copias, nrohojas, tipo_documento, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    233   /�       u          0    24646 
   hojas_ruta 
   TABLE DATA           �   COPY siacor.hojas_ruta (nur, codigo, nro, estado, fecha, usuario, proceso, viascorr, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    226   َ       v          0    24654    listas_derivacion 
   TABLE DATA           �   COPY siacor.listas_derivacion (usr_origen, usr_destino, opcion, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    227   ��       w          0    24659    seguimientos 
   TABLE DATA             COPY siacor.seguimientos (id_seguimiento, codigo, derivado_por, derivado_a, f_derivacion, f_recepcion, estado, id_accion, observaciones, padre, oficial, hijo, escusa, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    228   ��       x          0    24672    seguimientos_bkp 
   TABLE DATA             COPY siacor.seguimientos_bkp (id_seguimiento, codigo, derivado_por, derivado_a, f_derivacion, f_recepcion, estado, id_accion, observaciones, padre, oficial, hijo, escusa, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    229   ��       �          0    41040    vias 
   TABLE DATA           �   COPY siacor.vias (id_vias, codigo_usuario, codigo, habilitado, fecha_creacion, creado_por, fecha_modificacion, modificado_por, direccion_ip, accion) FROM stdin;
    siacor          gguzman    false    238   ��       �           0    0    parametrica_idparametrica_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.parametrica_idparametrica_seq', 63, true);
          public          gguzman    false    217            �           0    0    usr_mod_rol_id_usr_mod_rol_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.usr_mod_rol_id_usr_mod_rol_seq', 3, true);
          public          gguzman    false    234            �           0    0    agrupacion_idagru_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('siacor.agrupacion_idagru_seq', 1, false);
          siacor          gguzman    false    219            �           0    0    archivados_idarchivado_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('siacor.archivados_idarchivado_seq', 1, false);
          siacor          gguzman    false    221            �           0    0    correlativos_idcor_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('siacor.correlativos_idcor_seq', 8, true);
          siacor          gguzman    false    223            �           0    0 &   descripciondocumentos_iddescriptor_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('siacor.descripciondocumentos_iddescriptor_seq', 1, false);
          siacor          gguzman    false    225            �           0    0 "   seguimientos_bkp_idseguimiento_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('siacor.seguimientos_bkp_idseguimiento_seq', 1, false);
          siacor          gguzman    false    230            �           0    0    seguimientos_idseguimiento_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('siacor.seguimientos_idseguimiento_seq', 1, false);
          siacor          gguzman    false    231            �           0    0    vias_id_vias_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('siacor.vias_id_vias_seq', 3, true);
          siacor          gguzman    false    237            �           2606    32826    usr_mod_rol id_usr_mod_rol_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.usr_mod_rol
    ADD CONSTRAINT id_usr_mod_rol_pkey PRIMARY KEY (id_usr_mod_rol);
 I   ALTER TABLE ONLY public.usr_mod_rol DROP CONSTRAINT id_usr_mod_rol_pkey;
       public            gguzman    false    235            �           2606    24700    parametrica parametrica_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.parametrica
    ADD CONSTRAINT parametrica_pkey PRIMARY KEY (id_parametrica);
 F   ALTER TABLE ONLY public.parametrica DROP CONSTRAINT parametrica_pkey;
       public            gguzman    false    216            �           2606    32834    usuario usuario_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (codigo);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            gguzman    false    236            �           2606    24712    agrupacion agrupacion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY siacor.agrupacion
    ADD CONSTRAINT agrupacion_pkey PRIMARY KEY (id_agru, nur_p, nur_s);
 D   ALTER TABLE ONLY siacor.agrupacion DROP CONSTRAINT agrupacion_pkey;
       siacor            gguzman    false    218    218    218            �           2606    24714    archivados archivados_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY siacor.archivados
    ADD CONSTRAINT archivados_pkey PRIMARY KEY (id_archivado);
 D   ALTER TABLE ONLY siacor.archivados DROP CONSTRAINT archivados_pkey;
       siacor            gguzman    false    220            �           2606    32772 2   correlativos_asignados correlativos_asignados_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY siacor.correlativos_asignados
    ADD CONSTRAINT correlativos_asignados_pkey PRIMARY KEY (codigo);
 \   ALTER TABLE ONLY siacor.correlativos_asignados DROP CONSTRAINT correlativos_asignados_pkey;
       siacor            gguzman    false    232            �           2606    24716    correlativos correlativos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY siacor.correlativos
    ADD CONSTRAINT correlativos_pkey PRIMARY KEY (id_cor, codigo);
 H   ALTER TABLE ONLY siacor.correlativos DROP CONSTRAINT correlativos_pkey;
       siacor            gguzman    false    222    222            �           2606    32781 #   documentos describe_documentos_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY siacor.documentos
    ADD CONSTRAINT describe_documentos_pkey PRIMARY KEY (codigo);
 M   ALTER TABLE ONLY siacor.documentos DROP CONSTRAINT describe_documentos_pkey;
       siacor            gguzman    false    233            �           2606    24720 1   descripcion_documentos descripciondocumentos_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY siacor.descripcion_documentos
    ADD CONSTRAINT descripciondocumentos_pkey PRIMARY KEY (id_descriptor);
 [   ALTER TABLE ONLY siacor.descripcion_documentos DROP CONSTRAINT descripciondocumentos_pkey;
       siacor            gguzman    false    224            �           2606    24722    hojas_ruta hojasruta_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY siacor.hojas_ruta
    ADD CONSTRAINT hojasruta_pkey PRIMARY KEY (nur, codigo, nro);
 C   ALTER TABLE ONLY siacor.hojas_ruta DROP CONSTRAINT hojasruta_pkey;
       siacor            gguzman    false    226    226    226            �           2606    24724 (   listas_derivacion listas_derivacion_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY siacor.listas_derivacion
    ADD CONSTRAINT listas_derivacion_pkey PRIMARY KEY (usr_origen, usr_destino);
 R   ALTER TABLE ONLY siacor.listas_derivacion DROP CONSTRAINT listas_derivacion_pkey;
       siacor            gguzman    false    227    227            �           2606    24726 &   seguimientos_bkp seguimientos_bkp_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY siacor.seguimientos_bkp
    ADD CONSTRAINT seguimientos_bkp_pkey PRIMARY KEY (id_seguimiento);
 P   ALTER TABLE ONLY siacor.seguimientos_bkp DROP CONSTRAINT seguimientos_bkp_pkey;
       siacor            gguzman    false    229            �           2606    24728    seguimientos seguimientos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY siacor.seguimientos
    ADD CONSTRAINT seguimientos_pkey PRIMARY KEY (id_seguimiento);
 H   ALTER TABLE ONLY siacor.seguimientos DROP CONSTRAINT seguimientos_pkey;
       siacor            gguzman    false    228            �           2606    41046    vias vias_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY siacor.vias
    ADD CONSTRAINT vias_pkey PRIMARY KEY (id_vias);
 8   ALTER TABLE ONLY siacor.vias DROP CONSTRAINT vias_pkey;
       siacor            gguzman    false    238            k   �  x���ێ�0��g�"/�*g`��$�� A	�U����"��qP�o���u��@+�2+���c�䟱$^�ռ᭒t'$���=��@�k��+�{�L-ǿ�{/|=sB'����\x,xl;*��� Ͷ�6'�pWKX[�B�P����I��8�~V�o(BpqQL��5D1��ʔDy%^��E:%j������"!%k�D�cM�)���q���=96n�&/��Q� /����W���l�'!ko����Mu�؎�gc���32T��Y�
@��������fo,�,)$`
+XѶ�&�d�	����P�kC�"@�KK66�:���*�6Hdə�|Gr!"DT*s��<�|�+.ZcJ Q��p�١��B(�UJq�xT�A�������B�̘2m�T��G2�")+O;����P�Q��o�h�������~S����u���d��=\�$��yi�¦�DȪ�{>��k҃F}��#�
�d@,�q��d1;u�F�&H*�$�idLX�EDVF�f�����bM�"͋4&�OPh�9���ј� Y9*�(p��!Rھ1D��E5�q:"2fE��lbQu�Mն��N�d�f�]��Q�k������ ���[߯;����� oM�����.�U	���6;s���ڊ���	+�o+5/$KY�?�\�r�{{�a��s'A�!L{z��׾�~�� l�l���\�J	��1�88%�`��G������IO)����B#�d��롫i�Y0b{�.�+��q�Wf��a�$�\L�9�G���u�hG-���Z��a�!�6?HV5�kdq}���g��
����_�?����5�.p&�s��]E�ov&�>��`���g�C��MY^mqyb2���?I���緤����4��}}ww��:#�      ~   w   x�����0��Sd?�۲"�@�h�-Y"E�e��w���Tm��}^*e���K�	�fTb�<��3�)J�2	Sa8;A�tEX���*������������Fr�} ��B+           x���[o�0�g�S�!��l�%�SY�Y���Y��q(a�qI�~�97mZ[O����E ����(PW�]F��J�������u�L�u�g��h2_U�e���]]�_֚7����m�g4
��4~��&�N��U��hJ�7�H�ۛ㈡�<��;j���(a(-�j:�p	.�!�x(�t�@�P M&0�P 50�&À2@�Á3��
�ڋ(@� o��[Є]`� Ђ}���x��
 |%Yxp�
��,��OZ��E�}.���������4v��9/xF�%2�=�Y�Q���~Oc�W�yEd��:�zTGI�QfYI�v�K�K��?z����u)��j�8���;��O��U�y��&Ny?Vb��;�h��F(:D����%�۴^˹�We��4�u��4#��/5�D�پ�֐��#����Zŋ|�$��}\�c��q��>�y�e1r"5�!׍��f�7t��;�����:�^��e�=�N��|U"�      m      x������ � �      o      x������ � �      q     x����j�P����)�����w%��".��,�IK�&U��)���Qw#��92�**F6�@_�e͸"�Dt��ƪӥ�<4p��뱛����碬��5���_�Fd0��44�|���6+��̭��Ve�yɫM]�y�Z"i@���0�Z�}���!8k��G�P���T}?&��'3��W�|�Ф ��̦�0���A������+�;��S���:2��`����|��s����$^��,���0      {   �   x�}ͽ�0��^�7���-���.���!,�&Mp��%:�4�'�{���/���c�ٶ�Hʹ��9CYcj~��L�`9�z+�7�^�Sɯ��i
(��[�{�L`�91T��@� �gK�� �@W      s      x������ � �      |   �  x����n�0�y�y�8��#�f�,�!%�R/Np�H�� �з�3��j�U�-D���Vₙ���i��i�u��2¼	!��d����o�Q���]�Z�E�/E
R�"��Y�'pQ�J�|R��n2a�NqcUq�TK��M�lc\�L\�з�8.P��MS+(�2e+�Nm�}��l;U�AwK�;���1iYJ�+��D>b��4�0
�����c0����m�}�a��0%�z>�Θ	��?%Ut�!o���zk�{�6����΢ɗgs^�o(n�_]����$�ܥ���ܜ����pզ��OïT����vA��]�,_��mȋ	������*c��>~�:���c!'x�y������<d�_\ߥ�~��JyP����.np\\��;�<�hq+�ڻ:w�q�WK�v�      u      x������ � �      v   {   x���=�0@��9��Mc~v��#��H�Ha��][�C��g�:ֈ�ӹeS !�55�p�:��x�ԃ��,3 ���2!{�i����kle����	syn�7r�Q�Zi�Ftν:�3      w      x������ � �      x      x������ � �      �   �   x���A� ��p�^@��}۸qQ�n�!Ƅ`B��m�	H���/�#����C=�/5��b�ADW�Ӎ���(uo����ӧ��!��e��K��$�aO���`����}��4u���P|�}��Z���Z��!�Pu     