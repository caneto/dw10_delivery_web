<p align="center">
    <img src="\delivery_backoffice\assets\images\logo.png" width="100" alt="Logo App Vakinha Burger"/>
</p>

<h1 align="center">Vakinha Burger BackOffice</h1>

---

<h2>Tópicos 📋</h2>

   <p>

   - [📖 Sobre](#-sobre)
   - [📱 Preview](#-preview)
   - [📦 Assets](#-assets)
   - [🛠️ Funcionalidades e Tecnologias Estudadas](#%EF%B8%8F-funcionalidades-e-tecnologias-estudadas)
   - [🤯 Desafios e Aprendizados ao longo do caminho](#-desafios-e-aprendizados-ao-longo-do-caminho)
   - [🤔 Como usar](#-como-usar)
   - [💪 Como contribuir](#-como-contribuir)
   - [📝 Licença](#-licença)

   </p>

---

<h2>📖 Sobre</h2>

<p>
    Projeto desenvolvido na Dart Week | 10ª Edição, um evento de lançamento para a <a href="http://academiadoflutter.com.br/">Academia do Flutter (ADF)</a>, do <a href="https://github.com/rodrigorahman">Rodrigo Rahman</a>.<br><br>
    Nesse tempo de Pré-Acesso que obtive por ser um aluno da ADF (desde Outubro/2022), consegui entender com mais facilidade certos conceitos que ainda estavam confusos para mim, como a parte do <a href="https://pub.dev/packages/mobx">Mobx</a>, e o <a href="https://pub.dev/packages/flutter_modular">Modular</a>.<br>
</p>

---

<h2>📱 Preview</h2>

   <p align="center">
      <img src=".github/Vakinha-Burger-Demo.gif" width="400" alt="Vakinha Burger Demonstração">
   </p>

---

<h2>📦 Assets</h2>

- UI Design criado para o evento: <a href="https://www.figma.com/file/fVcyjAmHwhrydVh98vJHT2/Vaquinha_adm_230402?type=design&node-id=123-3100&t=Wjof0pg09NjZOilN-0">**Vakinha Burger BeckOffice**</a>
---   

<h2>🛠️ Funcionalidades e Tecnologias Estudadas</h2>

- Consulta da API usando o package Dio / Interceptors
- Utilização do Modular
- Fluxo de Login e conferencia via Web
- Persistência de dados Windows SessionStorage
- Extensions
- Mixins
- Global 
- Widgets
- Theme
- Telas: 
  - Splash (tela inicial do app para transição)
  - Login (onde possui o fluxo de login)
  - Home 
  - Products (onde fica os produtos, com cadastro e manipulação dos mesmos)
  - PaymentType (tela de formas de pagamento, na qual se cadastra cada uma, e as trata)
  - Order (onde podemos escolher a forma de pagamento e finalizar nosso pedido)
  - Template (um menu padadrão que entra em todas as telas)
   </p>

---

<h2>🤯 Desafios e Aprendizados ao longo do caminho</h2>

   <p>
   Como esse foi feito a versão de backoffice, usando a construção em WEB, usando arquitetura MVC com uso do Modular e o Mobx, alem de outros packages como o Dio, 
   Url_Strategy, brasil_filers, flutter_dotenv, awesome_snackbar_content, loading_animation_widget e o componente do Flutter Web Plugins.<br>
   Espero estar sempre aprendendo novas tecnologias com o Rahman e a comunidade incrivel de Flutter!
   </p>

---

<h2>🤔 Como usar</h2>

   ```
   É necessário ter o Flutter instalado. Para configurar o ambiente de desenvolvimento na sua máquina:
   https://flutter.dev/docs/get-started/install

   O aplicativo consome os dados do backend desenvolvido pela comunidade ADF chamado json_rest_server:
   https://pub.dev/packages/json_rest_server

   - Clone o repositório:
   $ git clone https://github.com/caneto/dw10_delivery_web dw10_vakinhar_burger_bloc

   - Entre no diretório:
   $ cd dw10_delivery_web\delivery_beckoffice

   - Instale as dependências:
   $ flutter pub get

   - Instale o json_rest_server
   $ dart pub global activate json_rest_server

   - Abra a pasta em CMD, o backend
   $ cd dw10_delivery_web\delivery_api

   - Para inicializá-lo, execute o comando:
   $ jrs run

   - Em outro terminal, no diretório raiz do projeto, execute:
   $ flutter run
   ```

---

<h2>💪 Como contribuir</h2>

   ```
   - Gosto bastante de seguir a seguinte Style Guide de Commits 😊:
   https://udacity.github.io/git-styleguide/

   - Dê um fork no projeto 

   - Cria uma nova branch com suas mudanças:
   $ git checkout -b my-feature

   - Salve suas mudanças e faça uma mensagem de commit message sobre suas alterações:
   $ git commit -m "feat: My new feature"

   - Envie suas mudanças:
   $ git push origin my-feature
   ```

---

<h2>📝 Licença</h2>

<p>
   Esse repositório está sobre a Licença GNU General Public License v3.0, e você pode vê-la no arquivo <a href="https://github.com/caneto/darkweek9_vakinha_burger/blob/main/LICENSE">LICENSE</a> para mais detalhes. 😉
</p>


---

   >Esse projeto foi desenvolvido com ❤️ por **[@Carlos Alberto Pinto](https://www.linkedin.com/in/canetorj/)**, com o instrutor **[@Rodrigo Rahman](https://br.linkedin.com/in/rodrigo-rahman)**, no evento #DartWeek da **[Academia do Flutter]**.<br>
   Se isso te ajudou, dê uma ⭐, e contribua, isso irá me ajudar também 😉

---

   <div align="center">

   [![Linkedin Badge](https://img.shields.io/badge/-Carlos%20Alberto-292929?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/canetorj/)](https://www.linkedin.com/in/canetorj/)

   </div>
