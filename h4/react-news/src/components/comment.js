import React from "react";
import commentBox from "commentbox.io";

class MyCommentBox extends React.Component {
    componentDidMount() {
        this.removeCommentBox = commentBox("5669785102712832-proj");
    }

    componentWillUnmount() {
        this.removeCommentBox();
    }

    render() {
        // @TODO: https://commentbox.io/docs for further notice of
        //  article-wise comment
        console.log("mounting " + this.props.id);
        return (
            <div className="commentbox" id={this.props.id}/>
        );
    }
}

export default MyCommentBox;