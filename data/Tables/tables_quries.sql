-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.departments
(
    dept_no character varying(5) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS public.dept_manager
(
    emp_no integer,
    dept_no character varying(6) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying(6) COLLATE pg_catalog."default",
    birth_date text COLLATE pg_catalog."default",
    first_name character varying(20) COLLATE pg_catalog."default",
    last_name character varying(20) COLLATE pg_catalog."default",
    sex character varying(5) COLLATE pg_catalog."default",
    hire_date text COLLATE pg_catalog."default",
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
);

CREATE TABLE IF NOT EXISTS public.titles
(
    title_id character varying(6) COLLATE pg_catalog."default" NOT NULL,
    title character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT titles_pkey PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(5) COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no integer,
    salary integer
);

ALTER TABLE IF EXISTS public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.dept_manager
    ADD CONSTRAINT fk_dept_no_to_departments FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id)
    REFERENCES public.titles (title_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.dept_emp
    ADD CONSTRAINT "FOREIGN KEY" FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_f
    ON public.dept_emp(emp_no);


ALTER TABLE IF EXISTS public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;