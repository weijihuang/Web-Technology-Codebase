import React from "react";
import MyBounceLoader from "./loader";
import SearchCard from "./searchCard";
import { Row, Col } from 'react-bootstrap';

class SearchPage extends React.Component {
    state = {
        loading: true,
        articles: [],
    };

    searchKeyword = this.props.location.search.slice(2,);

    fetchArticles (src) {
        let fetchUrl = "https://nodejs-hwj.appspot.com/search/" + src + "/" + this.searchKeyword;
        fetch(fetchUrl)
            .then(res => res.json())
            .then(data => {
                this.setState({
                    articles: this.state.articles.concat(data["search"]),
                    loading: false
                });
                console.log(this.state.articles);
            })
            .catch(err => {
                console.log("fetch error", err);
            });
    };

    componentDidMount() {
        this.fetchArticles(localStorage.getItem("news_src"));
    }

    render(){
        return (<><Row className={"p-3"}><Col xs={12}>
                <h4>Results</h4></Col>{this.state.loading ?
                <MyBounceLoader /> :
                // <p>this</p>

                this.state.articles.map((article, index) =>
                    <Col md = {3} xs ={12} key={index} style={{padding: '0'}} >
                    <SearchCard article={article} /></Col>)

            }</Row></>
        );
    };
}

export default SearchPage;
