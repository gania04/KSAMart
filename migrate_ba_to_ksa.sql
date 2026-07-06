-- ============================================================
-- MIGRASI: Rename tabel ba_users → ksa_users & ba_branches → ksa_branches
-- Project: KSA Mart Syariah (KSADZZIKRA)
-- Tanggal: Juli 2026
-- 
-- PETUNJUK: Jalankan script ini di Supabase SQL Editor
-- Dashboard → SQL Editor → New Query → Paste → Run
-- ============================================================

-- 1. Hapus policy lama
DROP POLICY IF EXISTS "ba_users_select" ON public.ba_users;
DROP POLICY IF EXISTS "ba_users_all" ON public.ba_users;
DROP POLICY IF EXISTS "ba_branches_select" ON public.ba_branches;
DROP POLICY IF EXISTS "ba_branches_all" ON public.ba_branches;

-- 2. Rename tabel
ALTER TABLE IF EXISTS public.ba_users RENAME TO ksa_users;
ALTER TABLE IF EXISTS public.ba_branches RENAME TO ksa_branches;

-- 3. Buat policy baru dengan nama yang sesuai
ALTER TABLE public.ksa_users ENABLE ROW LEVEL SECURITY;
CREATE POLICY "ksa_users_select" ON public.ksa_users FOR SELECT USING (true);
CREATE POLICY "ksa_users_all" ON public.ksa_users FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE public.ksa_branches ENABLE ROW LEVEL SECURITY;
CREATE POLICY "ksa_branches_select" ON public.ksa_branches FOR SELECT USING (true);
CREATE POLICY "ksa_branches_all" ON public.ksa_branches FOR ALL USING (true) WITH CHECK (true);

-- ============================================================
-- SELESAI! Tabel berhasil direname ke ksa_users & ksa_branches
-- Semua data tetap aman, tidak ada data yang dihapus.
-- ============================================================
