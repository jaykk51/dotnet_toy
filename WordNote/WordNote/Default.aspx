<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WordNote._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>WORD NOTE</h1>
        <p class="lead">외우고 싶은 영단어를 기록하는 나만의 단어 암기노트를 만들어보세요</p>
        <br /><br />
        
        <p><a href="word/RecommendWord.aspx" target="_blank" class="btn btn-primary btn-lg">추천 영단어 &raquo;</a></p>
    
        <p><a href="dbDocs/words.xlsx" target="_self"  class="btn btn-primary btn-sm" download>추천 영단어 다운로드&raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Word List</h2>
            <p>
               외우고자 하는 영단어들을 등록하고 관리해보세요. 
            </p>
            <p>
                <a class="btn btn-default" href="word/WordList.aspx">리스트 보기 &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Word Quiz</h2>
            <p>
               단어를 얼마나 외웠을까? 단어 퀴즈로 실력을 확인해보세요!
            </p>
            <p>
                <a class="btn btn-default" href="word/WordQuiz.aspx">퀴즈 풀기 &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Idiom List</h2>
            <p>
               사자성어, 영어로 표현한다면? 
            </p>
            <p>
                <a class="btn btn-default" href="idiom/IdiomList.aspx">리스트 보기 &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Idiom Quiz</h2>
            <p>
               영어로 풀이한 사자성어 퀴즈! 도전해보세요!
            </p>
            <p>
                <a class="btn btn-default" href="idiom/IdiomQuiz.aspx">퀴즈 풀기 &raquo;</a>
            </p>
        </div>
    
    </div>

</asp:Content>
