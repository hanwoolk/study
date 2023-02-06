import Control from "./components/Control";
import CreateContent from "./components/CreateContent";
import ReadContent from "./components/ReadContent";
import Subject from "./components/Subject";
import TOC from "./components/TOC";
import { useState } from "react";

function App() {
  let [mode, setMode] = useState("read");
  let [nextId, setNextId] = useState(4);
  let [selectedId, setSelectedId] = useState(2);
  let [contents, setContents] = useState([
    { id: 1, title: "HTML", body: "HTML is HyperText Markup Langauge." },
    { id: 2, title: "CSS", body: "CSS is for design." },
    { id: 3, title: "JavaScript", body: "JavaScript is for interactive." },
  ]);
  let subject = { title: "WEB", sub: "World Wide Web!" };
  return (
    <>
      <Subject
        title={subject.title}
        sub={subject.sub}
        onChangeMode={() => {}}
      ></Subject>
      <TOC></TOC>
      <Control></Control>
    </>
  );
}

export default App;
