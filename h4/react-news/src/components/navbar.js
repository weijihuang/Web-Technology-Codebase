import React, {useEffect} from "react";
import { FaBookmark} from 'react-icons/fa'
import {Navbar, Nav, OverlayTrigger, Tooltip} from 'react-bootstrap';
import SearchBox from "./searchBox";
import MySwitch from "./switch";

import '../css/navbar.css';
import ReactTooltip from "react-tooltip";

function MyNavbar() {
    useEffect(() => {
        if (!localStorage.getItem("favouriteArticles")){
            localStorage.setItem("favouriteArticles", JSON.stringify({}));
        }
    });

    return (
        <Navbar collapseOnSelect expand="md" bg="dark" variant="dark">
            <div style={{width:"20%"}}><SearchBox /></div>
            <Navbar.Toggle aria-controls="responsive-navbar-nav" />
            <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="mr-auto">
                <Nav.Link href="/">Home</Nav.Link>
                <Nav.Link href="/section/world">World</Nav.Link>
                <Nav.Link href="/section/politics">Politics</Nav.Link>
                <Nav.Link href="/section/business">Business</Nav.Link>
                <Nav.Link href="/section/technology">Technology</Nav.Link>
                <Nav.Link href="/section/sports">Sports</Nav.Link>
            </Nav>
                <Nav pullright={"true"}>
                    <Nav.Link href="/favourite">
                        <FaBookmark data-tip="Bookmark" data-for={"navbar"}/>
                        <ReactTooltip place="bottom" id={"navbar"} type="dark" effect="solid"/></Nav.Link>
                    <Nav.Link>
                    <MySwitch />
                    </Nav.Link>
                </Nav>
            </Navbar.Collapse>
        </Navbar>
    );
}

export default MyNavbar;