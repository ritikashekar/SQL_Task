PGDMP      #                |         	   CarRental    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    17559 	   CarRental    DATABASE     ~   CREATE DATABASE "CarRental" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "CarRental";
                postgres    false            �            1259    17605    car_details    TABLE     �   CREATE TABLE public.car_details (
    car_id integer,
    label character varying(255),
    model character varying(255),
    brand character varying(255),
    color character varying(255)
);
    DROP TABLE public.car_details;
       public         heap    postgres    false            �            1259    17560    cars    TABLE       CREATE TABLE public.cars (
    car_id integer NOT NULL,
    label character varying(255),
    car_description character varying(255),
    model character varying(255),
    brand character varying(255),
    color character varying(255),
    purchase_date date
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    17567 	   customers    TABLE     G  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    ssn integer,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    mobile_phone character varying(255),
    state character varying(255),
    country character varying(255),
    car_id integer
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    17580    location    TABLE     �   CREATE TABLE public.location (
    location_id integer NOT NULL,
    street character varying(255),
    street_number integer,
    city character varying(255),
    state character varying(255),
    country character varying(255),
    car_id integer
);
    DROP TABLE public.location;
       public         heap    postgres    false            �            1259    17579    location_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.location_location_id_seq;
       public          postgres    false    218            
           0    0    location_location_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.location_location_id_seq OWNED BY public.location.location_id;
          public          postgres    false    217            �            1259    17594    rentals    TABLE     �   CREATE TABLE public.rentals (
    reservation_number integer NOT NULL,
    amount integer,
    pick_up_date date,
    return_date date,
    pick_up_location integer NOT NULL,
    return_location integer NOT NULL,
    car_id integer
);
    DROP TABLE public.rentals;
       public         heap    postgres    false            �            1259    17593    rentals_reservation_number_seq    SEQUENCE     �   CREATE SEQUENCE public.rentals_reservation_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.rentals_reservation_number_seq;
       public          postgres    false    220                       0    0    rentals_reservation_number_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.rentals_reservation_number_seq OWNED BY public.rentals.reservation_number;
          public          postgres    false    219            a           2604    17583    location location_id    DEFAULT     |   ALTER TABLE ONLY public.location ALTER COLUMN location_id SET DEFAULT nextval('public.location_location_id_seq'::regclass);
 C   ALTER TABLE public.location ALTER COLUMN location_id DROP DEFAULT;
       public          postgres    false    217    218    218            b           2604    17597    rentals reservation_number    DEFAULT     �   ALTER TABLE ONLY public.rentals ALTER COLUMN reservation_number SET DEFAULT nextval('public.rentals_reservation_number_seq'::regclass);
 I   ALTER TABLE public.rentals ALTER COLUMN reservation_number DROP DEFAULT;
       public          postgres    false    220    219    220                      0    17605    car_details 
   TABLE DATA           I   COPY public.car_details (car_id, label, model, brand, color) FROM stdin;
    public          postgres    false    221   �"       �          0    17560    cars 
   TABLE DATA           b   COPY public.cars (car_id, label, car_description, model, brand, color, purchase_date) FROM stdin;
    public          postgres    false    215   s%       �          0    17567 	   customers 
   TABLE DATA           y   COPY public.customers (customer_id, ssn, first_name, last_name, email, mobile_phone, state, country, car_id) FROM stdin;
    public          postgres    false    216   t)                  0    17580    location 
   TABLE DATA           d   COPY public.location (location_id, street, street_number, city, state, country, car_id) FROM stdin;
    public          postgres    false    218   ^/                 0    17594    rentals 
   TABLE DATA           �   COPY public.rentals (reservation_number, amount, pick_up_date, return_date, pick_up_location, return_location, car_id) FROM stdin;
    public          postgres    false    220   �3                  0    0    location_location_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.location_location_id_seq', 50, true);
          public          postgres    false    217                       0    0    rentals_reservation_number_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.rentals_reservation_number_seq', 43, true);
          public          postgres    false    219            d           2606    17566    cars cars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    215            f           2606    17573    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    216            h           2606    17587    location location_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public            postgres    false    218            j           2606    17599    rentals rentals_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (reservation_number);
 >   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_pkey;
       public            postgres    false    220            k           2606    17574    customers customers_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 I   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_car_id_fkey;
       public          postgres    false    216    4708    215            l           2606    17588    location location_car_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 G   ALTER TABLE ONLY public.location DROP CONSTRAINT location_car_id_fkey;
       public          postgres    false    4708    218    215            m           2606    17600    rentals rentals_car_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(car_id);
 E   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_car_id_fkey;
       public          postgres    false    220    215    4708               }  x�m��r�0��������p	nH�ĝh��,��Q$F�H��X+*'�����~}��R��$+U�b�d+4��dĖ?�h��֧��$c��V�ڽS<��}�[LrV(�EVZӂܰ��5{D!�K2v1�C��@�+g��ʞ����xŮ����t�:)����qK9瑔+%��;%��lPv�� )i�n�6U��zz��1���9u�z%��z�����ˏ~BLd��P�M@Q�3hŊwZ	l���cy�J��h�S���o��D���wn��"IO��R::+�WmhU�����<W��"�z��s����մ�|�H�F��-��6��Ս<��a8f%j2WLl����Gy{����
0�rS�]�,p����x ��kЖ�;�V�(�ZA�1�G���a� �h@�㫪7�PY��������_�R2�l�쎃�rE�Ț^i{C�%�HQ~�(����w
�Y�4rslݙ�6�~��-�E�㒷Ʈ�i�d1=��s��nh�d��l�ڻ�6�A��n�H��x��r���zs��j�P�p8��vi�Q��:|��Y�6���f�p%�iI�Gt��J�F���p�[�OQ˩��\J�\��U1ٺ���i���������$�?����      �   �  x����r�8�����xɲ�K`�dRa+L2��7����(YNO?-�Ql��q�[��>-�"�9���Z�WJk����ܠ�΄
h)
��\d��h�HHbL���3Z�y*uY<ς�~f]�&�g8V<}mBiH{8B�ܦە�R�+l�J�'��ؗ�����Bc�^@b(�P�-�A�b�feay�ASm2�K(�ߛHF=Cd�&��pL�X~����C��U���^.��Q�F��P���e�L��-��7��{�g�{�&!��~%Ӽ�lDV�e�q�@/jU !�9��<��R��L��e6 ����i�F�Z��|#r�E�6Z=AW���<�6�fxnHzҦH���bһ��N��m�{��F1���&��B ij���7�T^k	E0iC��/rRwH�J�(�Ú2/HZ0��7M���h%��s ����#�	��L�X��˷8�0��j���q�,
x�$s<�&W�b�2ρ��>h��s<�6��T�eQ����aҊַe8�,�,|?$CL;��A0����?�P��c�����֟_�aHL�`��c4�ǌ��Q�J�T
��Z�s`m�m�U��N`,�vs6�Eʡ�q)���1�
t�ic�w{#�-�7��qE:Tp�%�j�M��:�Z}e����'�gb9�=mm��J�|��������ʸ)�:h�'
P�:��ý7�Qo3�䪼"F�LԆ�6��
E������>�Q�┹�8��SD-��'�Q|������<���K����G�=����;*�6����-��g��
Nୄ����yo"O��JXE���4�G��M���{�����앭��[ƩKI�����\���1s�z�)���H�R�/��~<6������'k[��m�L�#�v��}9�~�C�#��ش,��k/���a���x�}�60}��'�k�ڛ��V�W���k�Y��i��!�����L��3|��B���<�qx�[���"�����g�h      �   �  x�u��n9E��_��^�����K"�ae`0/��Q��n
���璽����yi��"謁"��$�Lg��뼢+-��i���%�C!�V�v�GX9�KQ���TJ�?�%E,�>̘�E%i]�&�ym�A,�a��#����.L��D��7�4ta��"��X���>0�'b�Zh��vO	K���u��]�7U��c��q��n��	=���ٻX)�P*����B���ZWT���"v9��Ӳi�^э�r+i¦�GL�^ֵ�
Z	ӨJ��K;��n"��;�GN�� ��FT�:e3�N\����=�|3�s"�֥<�'O�T�>��]�BT�؜��SZ#r�Lf��۬���A�.qk�]j\�ȴ;�9[Pr����2���yw9[���YԹ�vn��\�hLQof��*��� 	D-��y�Cg�ɏ�-EcE�\����w}@�m�xaUhp�']J�kEfLT�	#+��ջ(po%�u2���̍�f׳�(�t��2�}@��(���0�v&t�Ч��48z�Q�N�p�t��C���Y:;ӔE�8]�J��K�8��9ŷN���azЦɿ�37�ĄES�L]�]l$��c��B@~?��TH���Z�~�S�h>�M��#�^6�(�l'��v"�����ČEsZ�-뼐'T�f�۠�i^v:$�g���,Z��f��_�-{�S��TH��]�)�g�`���e),c�o��I8��!	>\���YQ2�2��Ύ�d��$��y�	C�8�x���Ŕ~������&롴n[��ST�8f��d���jϺ��\C�V��!>b+UU��M{�q�┦_����O\��5w����u;"�S��pSOh6�v/�zC+mlZ/V�҉��&,��| �r�+ܼ�����@G���}�<��S�h1@�t=I������Yhy���]��pP�q�X<���`r#�����L+E��,���j�,^�M=��r�Ƿ�/i�=>�3�{D�Ƿ`���\I���;�*�~�� a�z�=n�,��֞���Y��C~��
^:q�n�E��Y�_j���$bI��$�]�7���l1�N�Sg��}�K�K`О�e&JzRo�s��gv�}I�`�Yω{��KE;so{���B��u�j�B��,���=sK�xX�>�Pe0v�'�|�1nr)���� p��V��EU+y�䙧=�O����muʒ*o�ܕ-sx� \f��S(�����Wbߗ�dƒ9�n�ǲ8�5��D�u�;�WB�Cg����я<g�.�i�����8� B�G�_ɂ�cJ\�x���O�T�QS;�M+C���܊�PmqH�,�h2@���D����	�^���}h<��Kc��|��-�,{��S�����iи��m7�4������_���m+� ���>5��[�oc�����:�-��PlN�;��V�.��	/&M�����T�+�M��Iۮ�����y�u&���C�N'�?���
P�          u  x�eU�r�8||�� E�e%�lb[.ˉ+[�S��( )G��4AٖcU��@��==�����UO<�t���o�3-��?B�V��՜8t�^?�#�Lеy�}q��0�����}�L�J��Ǩ}c�&��U2E�nĪL�{��������w�rZ���{��4�����sV<'PTt3xo��H�9n�z��`%��w�ϡQј1����;�ϐ%�ha�:�Ϊ��Oׅ��*Vӽv~H��YM7m0���y��������v�:��l�[C�,K�omof��ٞ]�3�9��qhL�M���\ֵ�o�(R8��]���7!�N�5-��<��>�f�1!%�K�;�2�6�����+Z���OIq������	q�D �xN�c�w!N��8X���@]���k�x���n*&/`.Z]�{C׈��-tΞJ��Q�\xLo�0W���K�5�������.�裝|Wx�F�x٠W�T�LȊ��}�YBװ��k���q}�dL𚉌އ�c��g�n�=-[&�gLp�n��B' ���l7����~h��	��`�s��@nv,�8-���LH�<x�7)=!a����s0iڮ�/ۜB�L�_�ޤ
���t��9%�b"�[�~�,����nt�.r&
�0�I�+���EI�����h&
&J��~}����E�DK��]�h't���9�
GW�ӯc������T��J7Q�P�7
"j&3�s��Ir2t�ofF7��ɘ�8l�!���ˁ8��dN/p&1fz)tC�r�[�F<D�mO(�D��S-$>�_�����xH�$d�!���`A�	�W1��"m��:����P�%^i��̙,��I,ec�I;^,&�q��$��9r
slл���!K&!���q	]����Z����	V1��:L.k<���^�κf
��C�|A�ǾmM�~X�ޤ�2�8-�=$��,q�Q����4�3�� ��uk��G����9�ijQ���z�������0L-N��IR�^�[)�r�n�v�Ϸ;vvm�x͙*�?��0Q�^��!m��p��`��y��S�%�K����W:�J�*,i;���`�ؾ���i����A?�R1U��<U�Z��N��îY>J���>�cH��Z�^#�gq�3��;��A�h�           x�MT[�+1�{�U�<�r���c�A����rhxh�Z�Uk��x�?�
ޞ+�6Ľ��Mڃ�"ފ����хx/Mz��a�G�S��(�܃�">ːYZ}
�G�x�%}�XG|�%���a�G�yl�U����/g&fU�*�qfC	�U8�Wd�̈
p&�Ȋwu$(�^L��u$pl\5�vP��� W��w"�G	�cp'/�G����)��������H�]B�5�fP�C�	b�O�&�Q��bla�&7�G���v��,Br����|4D1V!�{�Rԛ|p����v:��҄����П��������<c
<� ���|e�gV�!��z���Xh�a	�֓[~��݅��Ԟܢ����8&�
PGr��/N5X *Ζ�)6�b�q� ���b[�G�U�ԙ�,�q48�	PWr��o�WH�8[4��i�K��L� ���>mq�W�������P\!5�\�,Nr��w���Ҩ�nZc{�r��@Z�c+(��J�D$���A���.7i���v�9�:x���'"a8     