from sqlalchemy import create_engine, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from datetime import date

Base = declarative_base()

class Pessoa(Base):
    __tablename__ = 'funcionario'
    codigo = Column(Integer, primary_key=True)
    nome = Column(String(150))

class Projeto(Base):
    __tablename__ = 'projeto'
    codigo = Column(Integer, primary_key=True)
    nome = Column(String(50))
    descricao = Column(String(250))
    responsavel = Column(Integer, ForeignKey('funcionario.codigo'))
    
    responsavel_obj = relationship("Pessoa")
    atividades = relationship("Atividade", back_populates="projeto_obj")

class Atividade(Base):
    __tablename__ = 'atividade'
    codigo = Column(Integer, primary_key=True)
    descricao = Column(String(250))
    projeto = Column(Integer, ForeignKey('projeto.codigo'))
    data_inicio = Column(Date)
    data_fim = Column(Date)

    projeto_obj = relationship("Projeto", back_populates="atividades")

def inserir_atividade(session, descricao, projeto_id, data_inicio, data_fim):
    nova_atividade = Atividade(
        descricao=descricao,
        projeto=projeto_id,
        data_inicio=data_inicio,
        data_fim=data_fim
    )
    session.add(nova_atividade)
    session.commit()
    print("Atividade inserida com sucesso.")

def atualizar_responsavel(session, projeto_id, novo_responsavel_id):
    projeto = session.query(Projeto).get(projeto_id)
    if projeto:
        projeto.responsavel = novo_responsavel_id
        session.commit()
        print("Responsável atualizado com sucesso.")
    else:
        print("Projeto não encontrado.")

def listar_projetos_atividades(session):
    projetos = session.query(Projeto).all()
    for projeto in projetos:
        print(f"Projeto: {projeto.nome} | Descrição: {projeto.descricao}")
        for atividade in projeto.atividades:
            print(f"  Atividade: {atividade.descricao} | Início: {atividade.data_inicio} | Fim: {atividade.data_fim}")
        print("-" * 60)

def main():
    engine = create_engine('postgresql+psycopg2://usuario:senha@localhost:5432/nome_do_banco')
    Session = sessionmaker(bind=engine)
    session = Session()

    inserir_atividade(session, "ES - Atividade 3", 4, date(2018, 10, 1), date(2018, 11, 1))
    atualizar_responsavel(session, 3, 13)
    listar_projetos_atividades(session)

    session.close()

if __name__ == "__main__":
    main()