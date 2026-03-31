---
title: How can we design for all types of users?
slug: Learn_web_development/Howto/Design_and_accessibility/Design_for_all_types_of_users
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này cung cấp các mẹo cơ bản để giúp bạn thiết kế website cho bất kỳ loại người dùng nào.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Trước tiên bạn nên đọc
        <a href="/en-US/docs/Learn_web_development/Howto/Design_and_accessibility/What_is_accessibility"
          >Khả năng tiếp cận là gì?</a
        >, vì chúng ta không đề cập chi tiết về khả năng tiếp cận ở đây.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Thiết kế toàn cầu có nghĩa là thiết kế cho mọi người, bất kể khuyết tật
        hay hạn chế kỹ thuật. Bài viết này liệt kê những cải thiện
        nhanh nhất quan trọng nhất cho thiết kế toàn cầu.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Khi bạn đang xây dựng website, một vấn đề hàng đầu cần xem xét là [Thiết kế Toàn cầu](https://en.wikipedia.org/wiki/Universal_design): phục vụ tất cả người dùng bất kể khuyết tật, hạn chế kỹ thuật, văn hóa, vị trí và v.v.

## Tìm hiểu sâu hơn

### Độ tương phản màu sắc

Để giữ văn bản của bạn dễ đọc, hãy sử dụng màu văn bản tương phản tốt với màu nền. Làm cho nó dễ đọc hơn, để giúp những người khiếm thị và những người sử dụng điện thoại của họ trên đường phố.

{{Glossary("W3C")}} định nghĩa một hỗn hợp màu tốt với thuật toán tính tỷ lệ độ sáng giữa nền trước và nền sau. Việc tính toán có vẻ khá phức tạp, nhưng chúng ta có thể dựa vào các công cụ để làm công việc cho chúng ta.

Hãy tải về và cài đặt [Color Contrast Analyser](https://vispero.com/lp/color-contrast-checker/) của Vispero.

> [!NOTE]
> Ngoài ra, bạn có thể tìm một số trình kiểm tra độ tương phản trực tuyến, như [Color Contrast Checker](https://webaim.org/resources/contrastchecker/) của WebAIM. Chúng tôi đề xuất một công cụ cục bộ vì nó đi kèm với một bộ chọn màu trên màn hình để tìm ra giá trị màu.

Ví dụ, hãy kiểm tra các màu trên trang này và xem chúng ta làm thế nào trong Color Contrast Analyser:

![Độ tương phản màu trên trang này: xuất sắc!](color-contrast.png)

Tỷ lệ độ tương phản độ sáng giữa văn bản và nền là 8.30:1, vượt qua tiêu chuẩn tối thiểu (4.5:1) và có thể cho phép nhiều người khiếm thị đọc trang này.

### Cỡ chữ

Bạn có thể chỉ định cỡ chữ trên website thông qua các đơn vị tương đối hoặc tuyệt đối.

#### Đơn vị tuyệt đối

Các đơn vị tuyệt đối không được tính theo tỷ lệ mà đề cập đến kích thước được đặt cứng, nói theo cách đó, và được biểu thị hầu hết thời gian bằng pixel (`px`). Ví dụ, nếu trong CSS bạn khai báo:

```css
body {
  font-size: 16px;
}
```

… bạn đang nói với trình duyệt rằng dù có chuyện gì xảy ra, cỡ chữ phải là 16 pixel. Các trình duyệt hiện đại xử lý quy tắc này bằng cách giả vờ rằng bạn đang yêu cầu "16 pixel khi người dùng đặt hệ số zoom là 100%".

#### Đơn vị tương đối

Còn được gọi là _đơn vị theo tỷ lệ_, các đơn vị tương đối được tính toán so với phần tử cha. Các đơn vị tương đối thân thiện hơn với khả năng tiếp cận vì chúng tôn trọng các cài đặt trên hệ thống của người dùng.

Các đơn vị tương đối được biểu thị bằng `em`, `%` và `rem`:

- Kích thước dựa trên phần trăm: `%`
  - : Đơn vị này nói với trình duyệt rằng cỡ chữ của một phần tử phải là N% của phần tử trước có cỡ chữ được biểu thị. Nếu không tìm thấy cha, cỡ chữ mặc định trong trình duyệt được coi là kích thước cơ sở để tính toán (thường tương đương 16 pixel).
- Kích thước dựa trên em: `em`
  - : Đơn vị này được tính theo cách tương tự như phần trăm, ngoại trừ bạn tính theo phần của 1 chứ không phải phần của 100. Được nói rằng "em" là chiều rộng của chữ hoa "M" trong bảng chữ cái (nói một cách gần đúng, một "M" vừa vào một hình vuông).
- Kích thước dựa trên rem: `rem`
  - : Đơn vị này tỷ lệ thuận với kích thước phần tử gốc và được biểu thị theo phần của 1, giống như `em`.

Giả sử chúng ta muốn cỡ chữ cơ sở là 16px và h1 (tiêu đề chính) tương đương 32px, nhưng nếu trong h1 chúng ta tìm thấy một `span` với class `subheading`, nó cũng phải được hiển thị ở cỡ chữ mặc định (thường 16px).

Đây là HTML chúng ta đang sử dụng:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Font size experiment</title>
  </head>
  <body>
    <h1>
      This is our main heading
      <span class="subheading">This is our subheading</span>
    </h1>
  </body>
</html>
```

CSS dựa trên phần trăm sẽ trông như thế này:

```css
body {
  /* 100% of the browser's base font size, so in most cases this will render as 16 pixels */
  font-size: 100%;
}
h1 {
  /* twice the size of the body, thus 32 pixels */
  font-size: 200%;
}
span.subheading {
  /* half the size of the h1, thus 16 pixels to come back to the original size */
  font-size: 50%;
}
```

Vấn đề tương tự được biểu thị bằng em:

```css
body {
  /* 1em = 100% of the browser's base font size, so in most cases this will render as 16 pixels */
  font-size: 1em;
}
h1 {
  /* twice the size of the body, thus 32 pixels */
  font-size: 2em;
}
span.subheading {
  /* half the size of the h1, thus 16 pixels to come back to the original size */
  font-size: 0.5em;
}
```

Như bạn có thể thấy, toán học nhanh chóng trở nên đáng sợ khi bạn phải theo dõi cha, cha của cha, cha của cha của cha, v.v. (Hầu hết các thiết kế được thực hiện trong phần mềm dựa trên pixel, vì vậy toán học phải được thực hiện bởi người đang viết mã CSS).

Hãy dùng `rem`. Đơn vị này tỷ lệ thuận với kích thước phần tử gốc chứ không phải với bất kỳ cha nào khác. CSS có thể được viết lại như sau:

```css
body {
  /* 1em = 100% of the browser's base font size, so in most cases this will render as 16 pixels */
  font-size: 1em;
}
h1 {
  /* twice the size of the body, thus 32 pixels */
  font-size: 2rem;
}
span.subheading {
  /* original size */
  font-size: 1rem;
}
```

Dễ hơn phải không? Điều này hoạt động với [mọi trình duyệt hiện tại](https://caniuse.com/#search=rem), vì vậy hãy thoải mái sử dụng đơn vị này.

> [!NOTE]
> Bạn có thể nhận thấy Opera Mini không hỗ trợ cỡ chữ bằng rem. Nó sẽ tự đặt cỡ chữ riêng của mình, vì vậy đừng bận tâm cho nó các đơn vị phông chữ.

#### Tại sao tôi muốn sử dụng các đơn vị theo tỷ lệ?

Vì bạn không biết khi nào trình duyệt sẽ từ chối zoom văn bản có kích thước được biểu thị bằng pixel. Ngoài ra, hãy kiểm tra số liệu thống kê của website: bạn có thể nhận được lượt truy cập từ các trình duyệt cũ hơn.

Chúng tôi khuyên những điều sau:

- Mô tả phông chữ bằng đơn vị `rem`, hầu hết các trình duyệt sẽ rất vui với chúng;
- Cho phép các trình duyệt cũ hiển thị phông chữ với engine nội bộ của chúng. Engine của trình duyệt sẽ bỏ qua bất kỳ thuộc tính hoặc giá trị nào trong CSS nếu chúng không thể xử lý được, để website của bạn vẫn có thể sử dụng nếu không hoàn toàn đúng với tầm nhìn của nhà thiết kế. Các trình duyệt cũ đang dần biến mất.

> [!NOTE]
> Kết quả của bạn có thể khác nhau. Nếu bạn phải phục vụ các trình duyệt cũ, bạn sẽ phải sử dụng `em` và làm thêm một chút toán.

### Chiều rộng dòng

Có một cuộc tranh luận lâu dài về chiều dài dòng trên web, nhưng đây là câu chuyện. Khi chúng ta có báo, các thợ in nhận ra rằng mắt người đọc sẽ gặp khó khăn khi chuyển từ dòng này sang dòng tiếp theo nếu các dòng quá dài. Giải pháp? Các cột.

Tất nhiên vấn đề không biến mất khi chúng ta chuyển sang Web. Mắt người đọc hoạt động như một con thoi đi từ dòng này sang dòng kia. Để dễ hơn cho mắt người, hãy giới hạn chiều rộng dòng khoảng 60 hoặc 70 ký tự.

Để đạt được điều này, bạn có thể chỉ định kích thước cho container văn bản của mình. Hãy xem xét HTML này:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Font size experiment</title>
  </head>
  <body>
    <div class="container">
      <h1>
        This is our main heading
        <span class="subheading">This is our subheading</span>
      </h1>

      <p>[lengthy text that spans many lines]</p>
    </div>
  </body>
</html>
```

Chúng ta có một `div` với class `container`. Chúng ta có thể tạo kiểu cho `div` để đặt chiều rộng của nó (sử dụng thuộc tính `width`) hoặc chiều rộng tối đa để nó không bao giờ quá lớn (sử dụng thuộc tính `max-width`). Nếu bạn muốn website đàn hồi/đáp ứng, và bạn không biết chiều rộng mặc định của trình duyệt là bao nhiêu, bạn có thể sử dụng thuộc tính `max-width` để cho phép tối đa 70 ký tự mỗi dòng và không hơn:

```css
div.container {
  max-width: 70em;
}
```

### Nội dung thay thế cho hình ảnh, âm thanh và video

Các website thường bao gồm các thứ ngoài văn bản thuần túy.

#### Hình ảnh

Hình ảnh có thể là trang trí hoặc thông tin, nhưng không có gì đảm bảo rằng người dùng của bạn có thể nhìn thấy chúng. Ví dụ,

- Người dùng khiếm thị dựa vào screen reader, chỉ có thể xử lý văn bản.
- Độc giả của bạn có thể đang sử dụng mạng nội bộ rất nghiêm ngặt chặn hình ảnh xuất phát từ {{Glossary("CDN")}}.
- Độc giả của bạn có thể đã tắt hình ảnh để tiết kiệm băng thông, đặc biệt trên thiết bị di động (xem bên dưới).

<!---->

- Hình ảnh trang trí
  - : Chúng chỉ để trang trí và không truyền đạt bất kỳ thông tin thực nào. Chúng thường có thể được thay thế bằng hình nền. Hãy đảm bảo chúng có thuộc tính `alt` rỗng: `<img src="deco.gif" alt="">` để chúng không làm tắc nghẽn văn bản.
- Hình ảnh thông tin
  - : Chúng được sử dụng để truyền đạt thông tin, do đó có tên gọi như vậy. Chúng có thể, ví dụ, hiển thị biểu đồ, hoặc hiển thị cử chỉ của người, hoặc bất kỳ thông tin nào khác. Tối thiểu, bạn phải cung cấp thuộc tính `alt` liên quan.

Nếu hình ảnh có thể được mô tả ngắn gọn, bạn có thể cung cấp thuộc tính `alt` và không cần gì thêm. Nếu hình ảnh không thể được mô tả ngắn gọn, bạn sẽ phải cung cấp cùng nội dung theo dạng khác trên cùng trang (ví dụ: bổ sung biểu đồ tròn với bảng cung cấp cùng dữ liệu), hoặc sử dụng thuộc tính `longdesc`. Giá trị của thuộc tính này là URL trỏ đến tài nguyên mô tả chi tiết nội dung hình ảnh một cách rõ ràng.

> [!NOTE]
> Việc sử dụng và thậm chí sự tồn tại của `longdesc` đã được tranh luận trong một thời gian khá dài. Vui lòng tham khảo [Image Description Extension (longdesc)](https://www.w3.org/TR/html-longdesc/) của W3C để có giải thích đầy đủ và các ví dụ kỹ lưỡng.

#### Âm thanh/video

Bạn cũng phải cung cấp các lựa chọn thay thế cho nội dung đa phương tiện.

- Phụ đề/Chú thích đầy đủ
  - : Bạn nên bao gồm phụ đề trong video của mình để phục vụ những khách truy cập không thể nghe âm thanh. Một số người dùng có thách thức về thính giác, thiếu loa hoạt động, hoặc làm việc trong môi trường ồn ào (như trên tàu).
- Bản ghi chép
  - : Phụ đề chỉ hoạt động nếu ai đó xem video. Nhiều người dùng không có thời gian, hoặc thiếu plugin hoặc codec phù hợp. Ngoài ra, các công cụ tìm kiếm chủ yếu dựa vào văn bản để lập chỉ mục nội dung của bạn. Vì tất cả những lý do này, hãy cung cấp bản ghi chép văn bản của file video/âm thanh.

### Nén hình ảnh

Một số người dùng có thể chọn hiển thị hình ảnh, nhưng vẫn có băng thông hạn chế, đặc biệt ở các nước đang phát triển và trên thiết bị di động. Nếu bạn muốn có website thành công, hãy nén hình ảnh của mình. Có nhiều công cụ giúp bạn làm điều đó, trực tuyến hoặc cục bộ. Nhìn chung, các công cụ cục bộ được ưu tiên vì chúng có thể được tích hợp tốt hơn với quy trình phát triển của bạn; các công cụ này bao gồm [ImageOptim](https://imageoptim.com/api) (Mac), [OptiPNG](https://optipng.sourceforge.net/) (tất cả nền tảng), và [PNGcrush](https://pmt.sourceforge.io/pngcrush/) (DOS, Unix/Linux).
