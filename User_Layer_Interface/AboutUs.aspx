<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="kuze.AboutUs" %>

<!DOCTYPE html>
<html>
<head>
    <title>About KUZÉ</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="AboutUsStyles.css" />
</head>

<body>
    <!--Navigation Bar -->
    <nav class="navbar">
        <div class="navbar-logo">
            <p>KUZE</p>
        </div>
        <div class="navbar-links">
            <ul class="navbar-list">
                <li><a href="MainPage.aspx">Home</a></li>
                <li><a href="AboutUs.aspx">About</a></li>
                <li><a href="ProductPage.aspx">Products</a></li>
                <li><a href="ContactUs.aspx">Contact</a></li>
                <li><a href="UserLogin.aspx">Account</a></li>
                <li><a href="ShoppingCart.aspx">Your Cart</a></li>
                <li><a href="HistoryPage.aspx">Order History</a></li>
            </ul>

        </div>
    </nav>
    <form id="form1" runat="server">
        <!-- Banner Section -->
        <div class="banner">
            <h5>kuze by ekoism</h5>
            <h1>About KUZÉ</h1>
            <img src="/Images/kuze-about.png" alt="Page Banner" />
        </div>

        <!-- Content Section -->
        <div class="content">
            <div class="content-left">
                <h2>The best from nature</h2>
                <p>At Kuze, we believe that every garment tells a story, and every textile carries an impact. That's why when we refer to "eco materials," we mean fabrics that go beyond conventional norms, significantly reducing their social and environmental footprint. </p>
                <h3>“ Reducing resource consumption is paramount for both material and societal sustainability. ”</h3>
            </div>
            <div class="content-right">
                <img class="about-image" src="/Images/kuze-about1.png" alt="Page Banner" />
                <h2>Recycling & Reusing</h2>
                <p>At the heart of sustainability lies the principle of recycling and reusing. It is through these practices that we can significantly reduce waste and preserve our precious resources. At Kuze, our dedication to a circular economy is unwavering. We believe in giving materials a second life, transforming discarded fabrics and items into new and purposeful creations. By embracing recycling and reusing, we actively contribute to a more sustainable future, where fashion becomes a catalyst for positive change.</p>
            </div>
        </div>
        <img src="/Images/kuze-vid.png" alt="Page Vid" />


        <!-- Team Section -->
        <div class="content-title">
            <h2>Meet Our Team</h2>
        </div>
        <div class="team">
            <div class="member-container">
                <img src="/Images/member-sin.png" alt="SinHan" />
                <label>SIN HAN</label>
            </div>
            <div class="member-container">
                <img src="/Images/member-cam.png" alt="Camellia" />
                <label>CAMELLIA</label>
            </div>
            <div class="member-container">
                <img src="/Images/member-evan.png" alt="Evan" />
                <label>EVAN</label>
            </div>
            <div class="member-container">
                <img src="/Images/member-nic.png" alt="Nicholas" />
                <label>NICHOLAS</label>
            </div>

        </div>

        <!-- Content Section -->
        <div class="content-title">
            <h2>Taking responsibility of the future.</h2>
        </div>
        <div class="content">
            <div class="content-left">
                <div class="section2">
                    <p>Taking responsibility for the future is a core principle that drives us. We understand the pressing need to address environmental challenges and are committed to being part of the solution. Through sustainable practices and conscious decision-making, we strive to make a positive impact on the planet and inspire others to join us on this journey. Embracing innovative technologies, ethical sourcing, and mindful production processes, we ensure that every step we take aligns with our vision of a better tomorrow.</p>
                    <p>Our dedication lies in creating a more sustainable fashion industry, one that values both style and sustainability, empowering individuals to be agents of change. </p>
                </div>
                <img src="/Images/kuze-about3.png" alt="About Img" />
                <h3>Quality<br />
                    =
                    <br />
                    Sustainability</h3>
                <img src="/Images/kuze-about4.png" alt="About Img" />
            </div>
            <div class="content-right">
                <div class="section2">
                    <p>We believe that true progress comes from collective efforts, and we invite you to join us in shouldering the responsibility for the future. Together, let's pave the way towards a world where fashion and environmental stewardship go hand in hand, where conscious choices and mindful actions shape a better world for generations to come.</p>
                    <p>In everything we do, we strive to exemplify the values of responsibility, integrity, and a deep respect for the planet we call home. Join us on this journey as we make a lasting difference and create a future that we can be proud to pass on. Together, let's embrace the responsibility for the future and shape a world where sustainability is not just a choice, but a way of life.</p>
                </div>
                <p>We have established strong partnerships with our suppliers in Singapore, forging relationships based on trust and reliability. Working closely with local suppliers allows us to maintain a direct and seamless connection, enhanced by frequent visits and open communication. By keeping the production process close to home, we have a comprehensive understanding of how our suppliers operate, and they understand our values and vision.</p>
                <p class="highlight">We think that the solution to more sustainable fashion lies not simply in using different fabrics, but also comes with longevity.</p>
                <p>With a deep appreciation for the power of details, we recognize that even small components like zippers and buttons can have a significant impact on the longevity of our products. That's why we prioritize using high-quality trimmings that are built to last. By choosing durable materials, we ensure that your garments withstand the test of time, reducing the need for replacements and minimizing waste.</p>
            </div>
        </div>
    </form>
    <!--Footer-->
    <footer class="footer">
        <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>

</html>

