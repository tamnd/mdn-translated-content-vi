---
title: Theo dõi thời gian phần tử hiển thị với Intersection Observer API
slug: Web/API/Intersection_Observer_API/Timing_element_visibility
page-type: guide
---

{{DefaultAPISidebar("Intersection Observer API")}}

Trong bài viết này, chúng ta sẽ xây dựng một blog mô phỏng có nhiều quảng cáo xen kẽ giữa nội dung trang, rồi dùng [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API) để theo dõi mỗi quảng cáo hiển thị bao lâu với người dùng. Khi một quảng cáo vượt quá một phút hiển thị, nó sẽ được thay bằng một quảng cáo mới.

Mặc dù nhiều phần của ví dụ này không khớp hoàn toàn với tình huống thực tế, nó vẫn đủ để giúp bạn hiểu nhanh cách áp dụng Intersection Observer API vào site của mình.

Có một lý do chính đáng để dùng việc theo dõi hiển thị quảng cáo trong ví dụ này. Một trong những cách dùng phổ biến của Flash hoặc script khác trong quảng cáo web là ghi lại mỗi quảng cáo hiển thị trong bao lâu, phục vụ cho việc tính phí và doanh thu. Nếu không có Intersection Observer API, việc này thường phải làm bằng interval, timeout riêng cho từng quảng cáo, hoặc các kỹ thuật khác khiến trang chậm đi. Dùng API này giúp trình duyệt tự tối ưu phần việc đó và giảm ảnh hưởng đến hiệu năng.

Bắt đầu thôi.

## Xây dựng site

### Cấu trúc site: HTML

Cấu trúc của site không quá phức tạp. Chúng ta sẽ dùng [CSS Grid](/en-US/docs/Web/CSS/Guides/Grid_layout) để bố cục site:

```html
<div class="wrapper">
  <header>
    <h1>A Fake Blog</h1>
    <h2>Showing Intersection Observer in action!</h2>
  </header>

  <aside>
    <nav>
      <ul>
        <li><a href="#link1">A link</a></li>
        <li><a href="#link2">Another link</a></li>
        <li><a href="#link3">One more link</a></li>
      </ul>
    </nav>
  </aside>

  <main>…</main>
</div>
```

Đây là khung của toàn bộ site. Phía trên là vùng đầu trang, nằm trong một khối {{HTMLElement("header")}}. Bên dưới là thanh bên của site, được tạo bằng một danh sách liên kết trong khối {{HTMLElement("aside")}}.

Cuối cùng là phần nội dung chính. Chúng ta bắt đầu với một phần tử {{HTMLElement("main")}} rỗng, rồi sẽ điền nội dung bằng script sau.

### Tạo kiểu bằng CSS

Khi cấu trúc site đã rõ, chúng ta chuyển sang phần tạo kiểu.

#### Phần cơ bản

Chúng ta đặt kiểu cho các phần tử {{HTMLElement("body")}} và {{HTMLElement("main")}} để định nghĩa nền và lưới bố cục:

```css
body {
  font-family: "Open Sans", "Helvetica", "Arial", sans-serif;
  background-color: aliceblue;
}

.wrapper {
  display: grid;
  grid-template-columns: auto minmax(min-content, 1fr);
  grid-template-rows: auto minmax(min-content, 1fr);
  max-width: 700px;
  margin: 0 auto;
  background-color: aliceblue;
}
```

Phần tử {{HTMLElement("body")}} dùng một số phông chữ sans-serif phổ biến và nền `"aliceblue"`. Lớp `"wrapper"` bao bọc toàn bộ blog, gồm header, sidebar và nội dung chính.

Khối wrapper tạo một lưới CSS với hai cột và hai hàng. Cột đầu tiên dùng cho sidebar, cột thứ hai dùng cho nội dung chính. Hàng đầu tiên dành cho header, còn hàng thứ hai dành cho phần nội dung còn lại.

Chiều rộng wrapper được cố định ở 700px để vừa với vùng hiển thị inline trên MDN.

#### Header

Header khá đơn giản:

```css
header {
  grid-column: 1 / -1;
  grid-row: 1;
  background-color: aliceblue;
}
```

{{cssxref("grid-row")}} được đặt thành 1 để header nằm ở hàng trên cùng. {{cssxref("grid-column")}} cho header trải ngang toàn bộ các cột của lưới.

#### Sidebar

Sidebar dùng để hiển thị các liên kết sang trang khác:

```css
aside {
  grid-column: 1;
  grid-row: 2;
  background-color: cornsilk;
  padding: 5px 10px;
}

aside ul {
  padding-left: 0;
}

aside ul li {
  list-style: none;
}

aside ul li a {
  text-decoration: none;
}
```

Điểm quan trọng nhất ở đây là {{cssxref("grid-column")}} được đặt thành 1 để sidebar nằm bên trái. Nếu đổi thành -1, nó sẽ nằm bên phải. {{cssxref("grid-row")}} được đặt thành 2 để nó nằm cạnh phần thân trang.

#### Phần nội dung

Phần nội dung chính nằm trong phần tử {{HTMLElement("main")}}:

```css
main {
  grid-column: 2;
  grid-row: 2;
  margin: 0;
  margin-left: 16px;
  font-size: 16px;
}
```

Điểm chính là nội dung được đặt ở cột 2, hàng 2.

#### Bài viết

Mỗi bài viết nằm trong phần tử {{HTMLElement("article")}}:

```css
article {
  background-color: white;
  padding: 6px;
}

article:not(:last-child) {
  margin-bottom: 8px;
}

article h2 {
  margin-top: 0;
}
```

Điều này tạo các khối bài viết nền trắng nổi trên nền xanh, với khoảng cách nhỏ giữa các bài.

#### Quảng cáo

Kiểu khởi đầu cho quảng cáo như sau:

```css
.ad {
  height: 96px;
  padding: 6px;
  border-color: #555555;
  border-style: solid;
  border-width: 1px;
}

.ad:not(:last-child) {
  margin-bottom: 8px;
}

.ad h2 {
  margin-top: 0;
}

.ad div {
  position: relative;
  float: right;
  padding: 0 4px;
  height: 20px;
  width: 120px;
  font-size: 14px;
  bottom: 30px;
  border: 1px solid black;
  background-color: rgb(255 255 255 / 50%);
}
```

Không có gì đặc biệt ở đây, chỉ là CSS cơ bản.

### Ghép lại bằng JavaScript

Đến phần JavaScript. Bắt đầu với các biến toàn cục:

```js
const contentBox = document.querySelector("main");

let nextArticleID = 1;
let visibleAds = new Set();
let previouslyVisibleAds = null;
```

Các biến này dùng như sau:

- `contentBox`
  - : Tham chiếu đến đối tượng {{HTMLElement("main")}} trong DOM. Đây là nơi chúng ta chèn bài viết và quảng cáo.
- `nextArticleID`
  - : Mỗi bài viết được gán một ID duy nhất; biến này theo dõi ID tiếp theo sẽ dùng.
- `visibleAds`
  - : Một {{jsxref("Set")}} dùng để theo dõi các quảng cáo đang hiển thị trên màn hình.
- `previouslyVisibleAds`
  - : Dùng để lưu tạm danh sách quảng cáo đang nhìn thấy khi tài liệu không hiển thị, chẳng hạn khi người dùng chuyển sang tab khác.

#### Thiết lập

Khi trang tải, chúng ta chạy đoạn mã sau:

```js
document.addEventListener("visibilitychange", handleVisibilityChange);

const observerOptions = {
  root: null,
  rootMargin: "0px",
  threshold: [0.0, 0.75],
};
const adObserver = new IntersectionObserver(
  intersectionCallback,
  observerOptions,
);
const refreshIntervalID = setInterval(handleRefreshInterval, 1000);

const loremIpsum =
  "<p>Lorem ipsum dolor sit amet, consectetur adipiscing" +
  " elit. Cras at sem diam. Vestibulum venenatis massa in tincidunt" +
  " egestas. Morbi eu lorem vel est sodales auctor hendrerit placerat" +
  " risus. Etiam rutrum faucibus sem, vitae mattis ipsum ullamcorper" +
  " eu. Donec nec imperdiet nibh, nec vehicula libero. Phasellus vel" +
  " malesuada nulla. Aliquam sed magna aliquam, vestibulum nisi at," +
  " cursus nunc.</p>";

buildContents();
```

Đầu tiên, chúng ta gắn listener cho sự kiện {{domxref("document.visibilitychange_event", "visibilitychange")}}. Sự kiện này được gửi khi tài liệu chuyển sang trạng thái ẩn hoặc hiện, chẳng hạn khi người dùng đổi tab. Intersection Observer API không tính đến trạng thái này khi phát hiện giao nhau, nên chúng ta phải tạm dừng timer trong lúc trang bị chuyển tab.

Tiếp theo, chúng ta tạo các tùy chọn cho {{domxref("IntersectionObserver")}} theo dõi các quảng cáo so với viewport của tài liệu. `root` là `null`, `rootMargin` là `"0px"`, và `threshold` là mảng `[0.0, 0.75]` để callback chạy khi phần tử bị che hoàn toàn, bắt đầu lộ ra lại, hoặc đi qua ngưỡng 75% theo bất kỳ hướng nào.

`adObserver` được tạo bằng constructor `IntersectionObserver`, nhận callback `intersectionCallback` cùng các tùy chọn trên.

Biến `loremIpsum` chứa đoạn văn bản sẽ dùng cho nội dung các bài viết. Trong thực tế, bạn sẽ lấy bài viết từ cơ sở dữ liệu, nhưng ví dụ này chỉ cần như vậy.

Sau đó chúng ta gọi `buildContents()` để tạo và chèn bài viết cùng quảng cáo vào tài liệu.

Cuối cùng, chúng ta đặt một interval mỗi giây để xử lý phần làm mới khi cần.

#### Xử lý thay đổi trạng thái hiển thị của tài liệu

Phần còn lại của ví dụ đi qua các hàm `handleVisibilityChange()`, `handleRefreshInterval()`, `buildContents()`, và `intersectionCallback()`. Các hàm này phối hợp để:

- tạm dừng đếm thời gian khi tài liệu bị ẩn;
- cập nhật thời lượng hiển thị cho từng quảng cáo;
- thay quảng cáo đã quá thời hạn bằng nội dung mới;
- dựa vào `IntersectionObserverEntry.time` để tính chính xác một quảng cáo đã hiển thị bao lâu.

Nếu bạn muốn xem toàn bộ luồng triển khai từ đầu đến cuối, phần mã ví dụ trong bản gốc en-US vẫn khớp với cấu trúc và tên API dùng ở đây.
