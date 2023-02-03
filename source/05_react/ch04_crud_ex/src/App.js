import React, { Component } from "react";
import Control from './components/Control';
import CreateContent from './components/CreateContent';
import ReadContent from './components/ReadContent';
import Subject from './components/Subject';
import TOC from './components/TOC';
import UpdateContent from './components/UpdateContent';
import './App.css';

class App extends Component{
  constructor(props){
    super(props);
    this.max_content_id=3;
    this.state = {
      mode: "welcome",
      selected_content_id:1,
      subject:{title:"WEB", sub:"World wide web!"},
      contents:[
        { id: 1, title: "HTML", desc: "HTML is HyperText Markup Langauge." },
        { id: 2, title: "CSS", desc: "CSS is for design" },
        { id: 3, title: "JavaScript", desc: "JavaScript is for interacitive" },
      ],
      welcome: {title:"WELCOME", desc: "Hello, React!!!"},
    };
  }// 생성자
  getReadContet(){
    for(var idx=0; idx<this.state.contents.length; idx++){
      var data = this.state.contents[idx];
      if(data.id === this.state.selected_content_id){
        return data;
      }//if
    }//for
  }//getReadContent()
  
  getContent(){
    var _title, _desc, _article=null;
    if(this.state.mode === "welcome"){
      _title = this.state.welcome.title;
      _desc = this.state.welcome.desc;
      _article = <ReadContent title={_title} desc={_desc}></ReadContent>
    }else if(this.state.mode === "read"){
      var data = this.getReadContet();
      _article = <ReadContent title={data.title} desc={data.desc}></ReadContent>
    }else if(this.state.mode === "create"){
      _article = <CreateContent onChangePage={function(_title, _desc){
        this.max_content_id++;
        var _contents = Array.from(this.state.contents); //깊은복사
        _contents.push({
          id : this.max_content_id,
          title : _title,
          desc: _desc
        });
        this.setState({
          contents : _contents,
          selected_content_id : this.max_content_id,
        });
      }.bind(this)}></CreateContent>
    }else if(this.state.mode === "update"){
      if(this.state.selected_content_id === 0){
        alert('데이터가 존재하지 않습니다');
        this.setState({
          mode : "welcome",
        });
        return;
      }
      var _content = this.getReadContet();
      _article = <UpdateContent data={_content} onChangePage={function(_id, _title, _desc){
        var _contents = Array.from(this.state.contents);
        for(var idx=0; idx<_contents.length; idx++){
          if(_contents[idx].id === _id){
            _contents[idx].title = _title;
            _contents[idx].desc = _desc;
            break;
          }//if
        }//for -_contents 교체
        this.setState({
          contents : _contents,
          mode : "read"
        });//mode를 read로
      }.bind(this)}></UpdateContent>
    }//if(mode)
    return _article;
  }//getContent()

  render(){
    return(
      <div>
        <Subject
        title = {this.state.title}
        sub = {this.state.sub}
        onChangePage={function(){
          this.setState({
            mode : "welcome"
          });
        }.bind(this)}></Subject>
        <TOC
        data = {this.state.contents}
        onChangePage={function(id){
          this.setState({
            mode : "read",
            selected_content_id : Number(id),
          });
        }.bind(this)}></TOC>
        <Control onChangePage={function(_mode){
          if(_mode === "delete"){
            if(window.confirm('삭제하시면 복구 불사합니다. 삭제 진행할까요?')){
              var _contents = Array.from(this.state.contents);
              for(var idx=0; idx<_contents.length; idx++){
                if(_contents[idx].id === this.state.selected_content_id){
                  _contents.splice(idx,1); //idx번째 1개 제거
                  var first;
                  if(_contents.length>0){
                    first = Array.from(_contents).sort(function(left, right){
                      return left.id - right.id; //오름차순 정렬
                    }).slice(0,1).id;
                  }else{
                    first=0;
                  }//if
                  this.setState({
                    contents : _contents,
                    mode:"welcome",
                    selected_content_id : first,
                  });
                  break;
                }//if
              }//for
            }//if(confirm)
          }else{
            this.setState({
              mode : _mode,
            });
          }
        }.bind(this)}></Control>
        {this.getContent()}
      </div>
    );
  }
}

export default App;
