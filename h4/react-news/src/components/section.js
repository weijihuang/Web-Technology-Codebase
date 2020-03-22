import React, { Component } from "react";
import MyBounceLoader from "./loader";

const serverUrl = "https://nodejs-hwj.appspot.com";

class SectionPage extends Component {
    constructor(props) {
        super(props);

        this.state = {
            section: "home",
            loading: true,
            articles: []
        }
    }

    fetchArticles = (src) => {
        let fetchUrl = serverUrl + "/" + src + "/" + this.state.section;
        fetch(fetchUrl)
            .then(res => res.json())
            .then(data => {
                console.log(data);
                this.setState({
                    articles: data["returnArray"],
                    loading: false
                })
            })
            .catch(err => {
                console.log("fetch error", err);
            });
    };

    componentDidMount() {
        this.fetchArticles("guardian");
    }

    render() {
        return (
            <>{this.state.loading ? <MyBounceLoader /> : <h1>Show news here!</h1>}</>
        );
    }
}

export default SectionPage;