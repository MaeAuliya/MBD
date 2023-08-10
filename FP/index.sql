    CREATE INDEX IF NOT EXISTS idx_name_pasien
        ON public.pasien USING btree
        (nama_pasien COLLATE pg_catalog."default" text_pattern_ops ASC NULLS LAST)
        TABLESPACE pg_default;


    explain analyze select * from pasien where nama_pasien like 'Maisan';
