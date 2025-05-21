import pyodbc

conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};'
    'SERVER=localhost;'
    'PORT=5432;'
    'DATABASE=nome_do_banco;'
    'UID=usuario;'
    'PWD=senha;'
)

cursor = conn.cursor()

def inserir_atividade(cursor, descricao, projeto_id, data_inicio, data_fim):
    cursor.execute("""
        INSERT INTO atividade (descricao, projeto, data_inicio, data_fim)
        VALUES (?, ?, ?, ?)
    """, (descricao, projeto_id, data_inicio, data_fim))
    conn.commit()
    print("Atividade inserida com sucesso.")

def atualizar_responsavel(cursor, projeto_id, novo_responsavel_id):
    cursor.execute("""
        UPDATE projeto
        SET responsavel = ?
        WHERE codigo = ?
    """, (novo_responsavel_id, projeto_id))
    conn.commit()
    print("Responsável atualizado com sucesso.")

def listar_projetos_atividades(cursor):
    cursor.execute("""
        SELECT
            p.nome AS projeto,
            p.descricao AS descricao_projeto,
            a.descricao AS atividade,
            a.data_inicio,
            a.data_fim
        FROM projeto p
        LEFT JOIN atividade a ON p.codigo = a.projeto
        ORDER BY p.nome, a.data_inicio;
    """)

    resultados = cursor.fetchall()
    for linha in resultados:
        print(f"Projeto: {linha.projeto} | Descrição: {linha.descricao_projeto}")
        print(f"  Atividade: {linha.atividade} | Início: {linha.data_inicio} | Fim: {linha.data_fim}")
        print("-" * 60)


inserir_atividade(cursor, 'ES - Atividade 3', 4, '2018-10-01', '2018-11-01')
atualizar_responsavel(cursor, 3, 13)
listar_projetos_atividades(cursor)

cursor.close()
conn.close()