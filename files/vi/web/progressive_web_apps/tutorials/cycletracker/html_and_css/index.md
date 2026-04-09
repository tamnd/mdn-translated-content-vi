---
title: "CycleTracker: HTML và CSS cơ bản"
short-title: HTML và CSS cơ bản
slug: Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS
page-type: tutorial-chapter
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker", "Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}

Để xây dựng một PWA, tức progressive web application, chúng ta cần tạo một ứng dụng web đầy đủ chức năng. Trong phần này, chúng ta sẽ đánh dấu HTML cho một trang web tĩnh và làm đẹp giao diện bằng CSS.

Dự án của chúng ta là tạo CycleTracker, một trình theo dõi chu kỳ kinh nguyệt. Bước đầu tiên trong [hướng dẫn PWA](/en-US/docs/Web/Progressive_web_apps/Tutorials) nhập môn này là viết HTML và CSS. Phần đầu trang là một form để người dùng nhập ngày bắt đầu và ngày kết thúc của mỗi kỳ. Phần dưới là danh sách các chu kỳ kinh nguyệt trước đó.

Chúng ta sẽ tạo một file HTML, với metadata trong phần head và một trang web tĩnh chứa một form cùng một vùng giữ chỗ để hiển thị dữ liệu người dùng nhập. Sau đó, chúng ta sẽ thêm một stylesheet CSS bên ngoài để cải thiện giao diện của site.

Để hoàn thành hướng dẫn này, bạn nên có hiểu biết cơ bản về [HTML](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Creating_the_content), [CSS](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Styling_the_content) và [JavaScript](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity). Nếu bạn chưa quen với các công nghệ này, MDN có loạt [Bắt đầu](/en-US/docs/Learn_web_development/Getting_started/Your_first_website), là phần mở đầu cho chuỗi bài học phát triển web.

Trong các phần tiếp theo, chúng ta sẽ thiết lập một [môi trường phát triển cục bộ](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection) và xem tiến trình trước khi thêm [chức năng JavaScript](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality) để biến nội dung tĩnh tạo ở phần này thành một ứng dụng web hoạt động. Khi đã có ứng dụng chạy được, chúng ta sẽ có thứ để nâng cấp dần thành PWA có thể cài đặt và hoạt động ngoại tuyến.

## Nội dung web tĩnh

HTML tĩnh của site, với các phần tử {{HTMLElement("link")}} và {{HTMLElement("script")}} giữ chỗ cho các file CSS và JavaScript bên ngoài chưa tạo, là:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Cycle Tracker</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <h1>Period tracker</h1>
    <form>
      <fieldset>
        <legend>Enter your period start and end date</legend>
        <p>
          <label for="start-date">Start date</label>
          <input type="date" id="start-date" required />
        </p>
        <p>
          <label for="end-date">End date</label>
          <input type="date" id="end-date" required />
        </p>
      </fieldset>
      <p>
        <button type="submit">Add Period</button>
      </p>
    </form>
    <section id="past-periods"></section>
    <script src="app.js" defer></script>
  </body>
</html>
```

Sao chép HTML này và lưu vào file tên `index.html`.

## Nội dung HTML

Ngay cả khi HTML trong `index.html` đã quen thuộc với bạn, chúng tôi vẫn khuyên bạn đọc kỹ phần này trước khi thêm một chút [dữ liệu cứng tạm thời](#temporary_hard-coded_results_text), thêm CSS vào stylesheet ngoài [`style.css`](#css_content), và tạo `app.js`, [JavaScript của ứng dụng](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality) giúp trang này hoạt động.

Dòng đầu tiên của HTML là phần mở đầu {{glossary("doctype")}}, đảm bảo nội dung hoạt động đúng.

```html
<!doctype html>
```

Các thẻ gốc {{HTMLelement("html")}} bao bọc toàn bộ nội dung với thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) xác định ngôn ngữ chính của trang.

```html
<!doctype html>
<html lang="en-US">
  <!-- the <head> and <body> will go here -->
</html>
```

### Phần head của tài liệu

{{HTMLelement("head")}} chứa thông tin có thể đọc bằng máy về web app, không hiển thị cho người đọc ngoại trừ `<title>`, là tiêu đề hiển thị trên tab trình duyệt.

`<head>` bao gồm toàn bộ [metadata](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata). Hai thông tin đầu tiên trong `<head>` của bạn luôn nên là khai báo bộ ký tự, xác định [mã hóa ký tự](/en-US/docs/Glossary/Character_encoding), và thẻ {{HTMLelement("meta")}} [viewport](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport), đảm bảo trang hiển thị đúng theo độ rộng khung nhìn và không bị co lại khi tải trên màn hình rất nhỏ.

```html
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
</head>
```

Chúng ta đặt tiêu đề trang là "Cycle Tracker" bằng phần tử {{HTMLelement("title")}}. Mặc dù nội dung của `<head>` không hiện trong trang, nội dung của `<title>` thì có! Văn bản bên trong `<title>` xuất hiện trên tab trình duyệt khi trang được tải, trong kết quả tìm kiếm, và là tiêu đề mặc định khi người dùng đánh dấu trang. Tiêu đề cũng cung cấp một tên truy cập cho người dùng trình đọc màn hình, giúp họ biết tab nào mình đang ở.

Tiêu đề có thể là "Menstrual cycle tracking application", nhưng chúng tôi chọn một tên ngắn hơn và kín đáo hơn.

```html
<title>Cycle Tracker</title>
```

Dù về mặt chính thức là tùy chọn, để cải thiện trải nghiệm người dùng, hai thẻ `<meta>` này và `<title>` là ba thành phần của `<head>` nên được xem như các thành phần bắt buộc trong mọi tài liệu HTML.

Hiện tại, thành phần cuối cùng chúng ta thêm vào `<head>` là phần tử {{HTMLelement("link")}} liên kết `style.css`, stylesheet chưa được viết, với HTML của chúng ta.

```html
<link rel="stylesheet" href="style.css" />
```

Phần tử HTML `<link>` được dùng để chỉ ra mối quan hệ giữa tài liệu hiện tại và một tài nguyên bên ngoài. Có hơn 25 giá trị được định nghĩa cho thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) - và còn nhiều giá trị khác không nằm trong bất kỳ đặc tả nào. Giá trị phổ biến nhất, `rel="stylesheet"`, nhập một tài nguyên bên ngoài dưới dạng stylesheet.

Chúng ta sẽ quay lại phần tử `<link>` và thuộc tính `rel` của nó ở phần sau, khi thêm [liên kết tới manifest](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file#adding_the_manifest_to_the_app).

### Phần body của tài liệu

Phần tử {{HTMLelement("body")}} chứa toàn bộ nội dung mà chúng ta muốn hiển thị khi người dùng truy cập site trên Internet.

Bên trong `<body>`, chúng ta thêm tên ứng dụng dưới dạng heading cấp 1 bằng [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) và một {{HTMLelement("form")}}.

```html
<body>
  <h1>Period tracker</h1>
  <form></form>
</body>
```

Form sẽ chứa hướng dẫn, các điều khiển form, nhãn cho từng điều khiển, và một nút gửi. Về phần điều khiển form, chúng ta cần người dùng nhập cả ngày bắt đầu và ngày kết thúc cho mỗi chu kỳ kinh nguyệt được gửi.

Bên trong `<form>`, chúng ta thêm một {{HTMLelement("fieldset")}} với một {{HTMLelement("legend")}} mô tả mục đích của nhóm trường form đó.

```html
<form>
  <fieldset>
    <legend>Enter your period start and end date</legend>
  </fieldset>
</form>
```

Các bộ chọn ngày là phần tử {{HTMLElement("input")}} có kiểu {{HTMLElement("input/date", "date")}}. Chúng ta thêm thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) để giảm lỗi người dùng bằng cách ngăn việc gửi form chưa hoàn chỉnh.

Để liên kết `<label>` với một điều khiển form, mỗi `<input>` có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) khớp với thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Attributes/for) của {{HTMLelement("label")}} liên quan. Nhãn liên quan cung cấp cho mỗi `<input>` một {{glossary("accessible name")}}.

```html
<label for="start-date">Start date</label>
<input type="date" id="start-date" required />
```

Gộp lại, bên trong `<fieldset>`, chúng ta thêm hai đoạn văn (phần tử {{HTMLelement("p")}}), mỗi đoạn có một bộ chọn ngày cho ngày bắt đầu và ngày kết thúc của chu kỳ đang được nhập, cùng với các {{HTMLelement("label")}} đi kèm. Chúng ta cũng thêm một phần tử {{HTMLelement("button")}} gửi form; chúng ta gắn nhãn cho nó là "Add period" bằng cách đặt văn bản đó giữa thẻ mở và thẻ đóng. `type="submit"` là tùy chọn, vì `submit` là kiểu mặc định của `<button>`.

```html
<form>
  <fieldset>
    <legend>Enter your period start and end date</legend>
    <p>
      <label for="start-date">Start date</label>
      <input type="date" id="start-date" required />
    </p>
    <p>
      <label for="end-date">End date</label>
      <input type="date" id="end-date" required />
    </p>
  </fieldset>
  <p>
    <button type="submit">Add Period</button>
  </p>
</form>
```

Chúng tôi khuyến khích bạn [tìm hiểu thêm về cách tạo form web có thể truy cập](/en-US/docs/Learn_web_development/Extensions/Forms).

### Dữ liệu kết quả cứng tạm thời

Tiếp theo, chúng ta thêm một {{HTMLElement("section")}} trống. Khung chứa này sẽ được điền bằng JavaScript.

```html
<section id="past-periods"></section>
```

Khi người dùng gửi form, chúng ta sẽ dùng JavaScript để lấy dữ liệu và hiển thị danh sách các chu kỳ trước đó cùng với tiêu đề cho phần này.

Tạm thời, chúng ta sẽ hard-code một ít nội dung trong `<section>` này, bao gồm một heading `<h2>` và vài chu kỳ cũ, để có thứ mà chúng ta có thể tạo kiểu khi viết CSS cho trang.

```html
<section id="past-periods">
  <h2>Past periods</h2>
  <ul>
    <li>From 01/01/2024 to 01/06/2024</li>
    <li>From 01/29/2024 to 02/04/2024</li>
  </ul>
</section>
```

Nội dung này, ngoài khung chứa `<section id="past-periods"></section>`, chỉ là tạm thời. Chúng ta sẽ xóa hoặc comment dữ liệu tạm này sau khi [hoàn thành CSS](#css_content) và hài lòng với giao diện ứng dụng.

### Liên kết JavaScript

Trước khi đóng `</body>`, chúng ta thêm một liên kết tới file JavaScript `app.js` chưa được viết. Chúng ta dùng thuộc tính [`defer`](/en-US/docs/Web/HTML/Reference/Elements/script#defer) để hoãn tải script này và đảm bảo JavaScript được thực thi sau khi HTML của tài liệu đã được phân tích.

```html
<script src="app.js" defer></script>
```

File `app.js` sẽ chứa toàn bộ cơ chế của ứng dụng, bao gồm các trình xử lý sự kiện cho `<button>`, lưu dữ liệu gửi lên vào local storage, và hiển thị các chu kỳ bên trong phần thân trang.

[File HTML cho bước này](https://github.com/mdn/pwa-examples/blob/main/cycletracker/html_and_css/index.html) giờ đã hoàn tất! Lúc này bạn có thể mở file trong trình duyệt, nhưng sẽ thấy nó khá đơn giản. Chúng ta sẽ sửa điều đó ở phần tiếp theo.

## Nội dung CSS

Giờ đây chúng ta có thể tạo kiểu cho HTML tĩnh bằng CSS. CSS hoàn chỉnh của chúng ta là:

```css
body {
  margin: 1vh 1vw;
  background-color: #eeffee;
}
ul,
fieldset,
legend {
  border: 1px solid;
  background-color: white;
}
```
