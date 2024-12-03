## Projeto Sistema de Atividades Especiais - GRUPO A

---

## **Integrantes do Grupo**
- **Arthur Ghizi** - [@Arthu085](https://github.com/Arthu085)  
- **Cristoffer Figueiredo Martins** - [@cristoffer21](https://github.com/cristoffer21)  
- **Gabriel Jorge Lóh** - [@gabrieljloh](https://github.com/gabrieljloh)  
- **Gabriel Custódio Boelter** - [@GabrielBoelter](https://github.com/GabrielBoelter)  
- **Jean Lucas Preis** - [@JeanPrei](https://github.com/JeanPrei)  
- **João Vitor Figueiredo Espindola** - [@joaovfe](https://github.com/joaovfe)  

---

## **Modelo Físico do Banco de Dados**

O modelo físico foi desenvolvido utilizando a ferramenta [dbdiagram.io](https://dbdiagram.io/). Ele serviu como base para a exportação dos scripts DDL das tabelas e seus relacionamentos.  

- **Arquivo fonte**: [Modelo Físico](https://dbdiagram.io/d/6561325e3be1495787b1c71a).  
- **Imagem do modelo**:  

![Modelo Físico do Banco de Dados](https://github.com/jlsilva01/projeto_final_bd2_satc_2023/assets/484662/1fefa9fd-868c-4209-8cc5-d32cd73fa46d)  

---

## **Dicionário de Dados**

O dicionário de dados contém informações detalhadas sobre as tabelas e índices utilizados no projeto.  
- **Arquivo do dicionário de dados**: [template1.xlsx](dicionario_dados/template1.xlsx).

---

## **Scripts SQL**

O projeto utiliza o banco de dados [PostgreSQL](https://www.postgresql.org/download/), uma plataforma open source. Os scripts estão organizados por categoria:  

- **DDL (Definição de Tabelas e Relacionamentos)**: [ddl.sql](scripts_sql/ddl.sql)  
- **Índices**: [indices.sql](scripts_sql/indices.sql)  
- **DML (Manipulação de Dados)**: [dml.sql](scripts_sql/dml.sql)  
- **Triggers**: [triggers.sql](scripts_sql/triggers.sql)  
- **Stored Procedures**: [stored_procedures.sql](scripts_sql/stored_procedures.sql)  
- **Functions**: [functions.sql](scripts_sql/functions.sql)  

---

## **Código-Fonte do Sistema**

O sistema foi desenvolvido como um **projeto monolítico** utilizando as seguintes tecnologias:  
- **Linguagem de programação**: PHP  
- **Framework**: Laravel  
- **Banco de Dados**: PostgreSQL hospedado no **Supabase**, garantindo acesso centralizado ao banco de dados para todos os usuários, sem a necessidade de criar o banco localmente a cada acesso.  

O uso do Laravel, aliado ao design monolítico, facilitou a integração com o banco de dados e garantiu simplicidade no desenvolvimento do CRUD.  

O código-fonte do projeto pode ser acessado aqui: [Código Fonte](fonte/).  

---

## **Relatório Final**

O relatório final, com detalhes sobre o desenvolvimento do projeto, está disponível no arquivo:  
- [template1.docx](relatorio/template1.docx)  

---
