---
title: Bao gồm đồ họa véc-tơ trong HTML
short-title: Đồ họa véc-tơ
slug: Learn_web_development/Core/Structuring_content/Including_vector_graphics_in_HTML
page-type: learn-module-chapter
sidebar: learnsidebar
---

Đồ họa véc-tơ rất hữu ích trong nhiều trường hợp — chúng có kích thước tệp nhỏ và có khả năng mở rộng cao, vì vậy chúng không bị vỡ pixel khi phóng to hoặc được mở rộng lên kích thước lớn. Trong bài viết này, chúng ta sẽ chỉ cho bạn cách đưa một cái vào trang web của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn nên biết
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">kiến thức cơ bản về HTML</a>
        và cách
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images"
          >chèn hình ảnh vào tài liệu của bạn</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu cách nhúng hình ảnh SVG (véc-tơ) vào trang web.</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bài viết này không có ý định dạy bạn SVG; chỉ là nó là gì, và cách thêm nó vào trang web.

## Đồ họa véc-tơ là gì?

Trên web, bạn sẽ làm việc với hai loại hình ảnh — **hình ảnh raster**, và **hình ảnh véc-tơ**:

- **Hình ảnh raster** được xác định bằng cách sử dụng lưới điểm ảnh — tệp hình ảnh raster chứa thông tin cho thấy chính xác nơi mỗi điểm ảnh được đặt và chính xác màu gì nó phải là. Các định dạng raster web phổ biến bao gồm Bitmap (`.bmp`), PNG (`.png`), JPEG (`.jpg`), và GIF (`.gif`).
- **Hình ảnh véc-tơ** được xác định bằng cách sử dụng các thuật toán — tệp hình ảnh véc-tơ chứa các định nghĩa hình dạng và đường dẫn mà máy tính có thể sử dụng để tính toán hình ảnh sẽ trông như thế nào khi được hiển thị trên màn hình. Định dạng {{glossary("SVG")}} cho phép chúng ta tạo đồ họa véc-tơ mạnh mẽ để sử dụng trên Web.

Để cho bạn biết sự khác biệt giữa hai loại, hãy xem một ví dụ. Bạn có thể tìm thấy ví dụ này trực tiếp trên repo GitHub của chúng ta dưới dạng [vector-versus-raster.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/adding-vector-graphics-to-the-web/vector-versus-raster.html) — nó hiển thị hai hình ảnh trông giống hệt nhau cạnh nhau, của một ngôi sao đỏ với bóng đổ màu đen. Sự khác biệt là hình bên trái là PNG, và hình bên phải là SVG.

Sự khác biệt trở nên rõ ràng khi bạn phóng to trang — hình ảnh PNG trở nên vỡ điểm ảnh khi bạn phóng to vì nó chứa thông tin về nơi mỗi điểm ảnh nên ở (và màu gì). Khi nó được phóng to, mỗi điểm ảnh được tăng kích thước để lấp đầy nhiều điểm ảnh trên màn hình, vì vậy hình ảnh bắt đầu trông giống như hình khối. Tuy nhiên, hình ảnh véc-tơ vẫn tiếp tục trông đẹp và sắc nét, vì bất kể kích thước là gì, các thuật toán được sử dụng để tính toán các hình dạng trong hình ảnh, với các giá trị được mở rộng khi nó lớn hơn.

![Hai hình ngôi sao](raster-vector-default-size.png)

![Hai hình ngôi sao được phóng to, một sắc nét và một mờ](raster-vector-zoomed.png)

> [!NOTE]
> Các hình ảnh trên thực tế đều là PNG — với ngôi sao bên trái trong mỗi trường hợp đại diện cho hình ảnh raster, và ngôi sao bên phải đại diện cho hình ảnh véc-tơ. Một lần nữa, hãy truy cập demo [vector-versus-raster.html](https://mdn.github.io/learning-area/html/multimedia-and-embedding/adding-vector-graphics-to-the-web/vector-versus-raster.html) để xem ví dụ thực!

Hơn nữa, các tệp hình ảnh véc-tơ nhẹ hơn nhiều so với các tệp raster tương đương, vì chúng chỉ cần giữ một số thuật toán, thay vì thông tin về mỗi điểm ảnh trong hình ảnh riêng lẻ.

## SVG là gì?

[SVG](/en-US/docs/Web/SVG) là ngôn ngữ dựa trên {{glossary("XML")}} để mô tả hình ảnh véc-tơ. Về cơ bản, nó là đánh dấu, như HTML, ngoại trừ việc bạn có nhiều phần tử khác nhau để xác định các hình dạng bạn muốn xuất hiện trong hình ảnh, và các hiệu ứng bạn muốn áp dụng cho những hình dạng đó. SVG dùng để đánh dấu đồ họa, không phải nội dung. SVG xác định các phần tử để tạo các hình dạng cơ bản, như {{svgelement("circle")}} và {{svgelement("rect")}}, cũng như các phần tử để tạo các hình dạng phức tạp hơn, như {{svgelement("path")}} và {{svgelement("polygon")}}. Các tính năng SVG nâng cao hơn bao gồm {{svgelement("feColorMatrix")}} (biến đổi màu sắc bằng ma trận biến đổi), {{svgelement("animate")}} (tạo hoạt hình cho các phần của đồ họa véc-tơ), và {{svgelement("mask")}} (áp dụng mặt nạ lên trên hình ảnh).

Là một ví dụ cơ bản, mã sau đây tạo một vòng tròn và hình chữ nhật:

```html
<svg
  version="1.1"
  baseProfile="full"
  width="300"
  height="200"
  xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="black" />
  <circle cx="150" cy="100" r="90" fill="blue" />
</svg>
```

Điều này tạo ra đầu ra sau:

{{ EmbedLiveSample('What_is_SVG', 300, 240, "", "") }}

Từ ví dụ trên, bạn có thể có cảm giác SVG dễ viết tay. Đúng vậy, bạn có thể viết tay SVG đơn giản trong trình soạn thảo văn bản, nhưng đối với hình ảnh phức tạp, điều này nhanh chóng trở nên rất khó khăn. Để tạo hình ảnh SVG, hầu hết mọi người sử dụng trình soạn thảo đồ họa véc-tơ như [Inkscape](https://inkscape.org/) hoặc [Illustrator](https://en.wikipedia.org/wiki/Adobe_Illustrator). Những gói này cho phép bạn tạo ra nhiều loại minh họa khác nhau bằng cách sử dụng các công cụ đồ họa, và tạo ra các xấp xỉ của ảnh chụp (ví dụ tính năng Trace Bitmap của Inkscape.)

SVG có một số ưu điểm bổ sung ngoài những ưu điểm được mô tả cho đến nay:

- Văn bản trong hình ảnh véc-tơ vẫn có thể truy cập được (điều này cũng mang lại lợi ích cho {{glossary("SEO")}} của bạn).
- SVG rất phù hợp để định kiểu/viết script, vì mỗi thành phần của hình ảnh là một phần tử có thể được tạo kiểu thông qua CSS hoặc viết script thông qua JavaScript.

Vậy tại sao ai đó lại muốn sử dụng đồ họa raster thay vì SVG? SVG có một số nhược điểm:

- SVG có thể trở nên phức tạp rất nhanh, có nghĩa là kích thước tệp có thể tăng lên; các SVG phức tạp cũng có thể mất thời gian xử lý đáng kể trong trình duyệt.
- SVG có thể khó tạo hơn hình ảnh raster, tùy thuộc vào loại hình ảnh bạn đang cố gắng tạo.

Đồ họa raster được cho là tốt hơn cho các hình ảnh có độ chính xác phức tạp như ảnh chụp, vì những lý do được mô tả ở trên.

Đồ họa SVG được xuất từ các trình soạn thảo như Inkscape có nhiều chỗ để tối ưu hóa kích thước. Trước khi triển khai chúng lên web, bạn có thể muốn chạy chúng qua bộ tối ưu hóa SVG như [SVGO](https://www.npmjs.com/package/svgo).

## Thêm SVG vào trang của bạn

Trong phần này, chúng ta sẽ xem qua các cách khác nhau để bạn có thể thêm đồ họa véc-tơ SVG vào trang web của mình.

### Cách nhanh: phần tử `img`

Để nhúng SVG thông qua phần tử {{htmlelement("img")}}, bạn chỉ cần tham chiếu nó trong thuộc tính src như bạn mong đợi. Bạn sẽ cần thuộc tính `height` hoặc `width` (hoặc cả hai nếu SVG của bạn không có {{glossary("aspect ratio")}} vốn có). Nếu bạn chưa làm vậy, vui lòng đọc [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images).

```html
<img
  src="equilateral.svg"
  alt="triangle with all three sides equal"
  height="87"
  width="100" />
```

#### Ưu điểm

- Cú pháp hình ảnh nhanh, quen thuộc với văn bản tương đương tích hợp sẵn trong thuộc tính `alt`.
- Bạn có thể dễ dàng biến hình ảnh thành siêu liên kết bằng cách lồng `<img>` bên trong phần tử {{htmlelement("a")}}.
- Tệp SVG có thể được trình duyệt lưu vào bộ nhớ cache, dẫn đến thời gian tải nhanh hơn cho bất kỳ trang nào sử dụng hình ảnh được tải trong tương lai.

#### Nhược điểm

- Bạn không thể thao tác hình ảnh bằng JavaScript.
- Nếu bạn muốn kiểm soát nội dung SVG bằng CSS, bạn phải bao gồm các kiểu CSS nội tuyến trong mã SVG. (Các stylesheet ngoài được gọi từ tệp SVG không có hiệu lực.)
- Bạn không thể tạo kiểu lại hình ảnh bằng các lớp giả CSS (như `:focus`).

### Khắc phục sự cố và hỗ trợ đa trình duyệt

Đối với các trình duyệt không hỗ trợ SVG (IE 8 trở xuống, Android 2.3 trở xuống), bạn có thể tham chiếu PNG hoặc JPG từ thuộc tính `src` và sử dụng thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) (chỉ các trình duyệt gần đây nhận ra) để tham chiếu SVG. Trong trường hợp này, chỉ các trình duyệt hỗ trợ mới tải SVG — các trình duyệt cũ hơn sẽ tải PNG thay vào đó:

```html
<img
  src="equilateral.png"
  alt="triangle with equal sides"
  srcset="equilateral.svg" />
```

Bạn cũng có thể sử dụng SVG làm hình ảnh nền CSS, như được hiển thị dưới đây. Trong mã dưới đây, các trình duyệt cũ hơn sẽ giữ lấy PNG mà họ hiểu, trong khi các trình duyệt mới hơn sẽ tải SVG:

```css
background: url("fallback.png") no-repeat center;
background-image: url("image.svg");
background-size: contain;
```

Giống như phương thức `<img>` được mô tả ở trên, việc chèn SVG sử dụng hình ảnh nền CSS có nghĩa là SVG không thể được thao tác với JavaScript, và cũng chịu những hạn chế CSS tương tự.

Nếu SVG của bạn không hiển thị, có thể vì máy chủ của bạn không được thiết lập đúng cách. Nếu đó là vấn đề, [bài viết này sẽ chỉ cho bạn hướng đúng](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Getting_started#a_word_on_web_servers_for_.svgz_files).

### Cách đưa mã SVG vào HTML của bạn

Bạn cũng có thể mở tệp SVG trong trình soạn thảo văn bản, sao chép mã SVG và dán vào tài liệu HTML của bạn — đây đôi khi được gọi là đưa **SVG nội tuyến**, hoặc **nhúng SVG**. Hãy đảm bảo đoạn mã SVG của bạn bắt đầu bằng thẻ mở `<svg>` và kết thúc bằng thẻ đóng `</svg>`. Đây là một ví dụ rất đơn giản về những gì bạn có thể dán vào tài liệu của mình:

```html
<svg width="300" height="200">
  <rect width="100%" height="100%" fill="green" />
</svg>
```

#### Ưu điểm

- Đặt SVG nội tuyến tiết kiệm một yêu cầu HTTP, và do đó có thể giảm thời gian tải của bạn một chút.
- Bạn có thể gán `class` và `id` cho các phần tử SVG và tạo kiểu với CSS, trong SVG hoặc bất cứ nơi nào bạn đặt các quy tắc kiểu CSS cho tài liệu HTML của mình. Thực tế, bạn có thể sử dụng bất kỳ [thuộc tính trình bày SVG](/en-US/docs/Web/SVG/Reference/Attribute#presentation_attributes) nào làm thuộc tính CSS.
- Nhúng SVG là cách tiếp cận duy nhất cho phép bạn sử dụng tương tác CSS (như `:focus`) và hoạt hình CSS trên hình ảnh SVG của bạn (ngay cả trong stylesheet thông thường.)
- Bạn có thể biến đánh dấu SVG thành siêu liên kết bằng cách gói nó trong phần tử {{htmlelement("a")}}.

#### Nhược điểm

- Phương pháp này chỉ phù hợp nếu bạn đang sử dụng SVG ở một nơi duy nhất. Trùng lặp làm tăng khối lượng bảo trì tốn tài nguyên.
- Mã SVG thêm tăng kích thước tệp HTML của bạn.
- Trình duyệt không thể lưu SVG nội tuyến vào bộ nhớ cache như cách nó lưu các tài sản hình ảnh thông thường, vì vậy các trang bao gồm hình ảnh sẽ không tải nhanh hơn sau khi trang đầu tiên chứa hình ảnh được tải.
- Bạn có thể bao gồm dự phòng trong phần tử {{svgelement("foreignObject")}}, nhưng các trình duyệt hỗ trợ SVG vẫn tải xuống mọi hình ảnh dự phòng. Bạn cần cân nhắc liệu chi phí thêm có thực sự đáng hay không, chỉ để hỗ trợ các trình duyệt lỗi thời.

### Cách nhúng SVG bằng `iframe`

Bạn có thể mở hình ảnh SVG trong trình duyệt của mình giống như các trang web. Vì vậy, việc nhúng tài liệu SVG với `<iframe>` được thực hiện giống như cách chúng ta đã nghiên cứu trong [Từ \<object> đến \<iframe> — các công nghệ nhúng tổng quát](/en-US/docs/Learn_web_development/Core/Structuring_content/General_embedding_technologies).

Đây là một đánh giá nhanh:

```html
<iframe src="triangle.svg" width="500" height="500" sandbox></iframe>
```

Đây chắc chắn không phải là phương pháp tốt nhất để chọn:

#### Nhược điểm

- Các phần tử `<iframe>` có thể bao gồm nội dung dự phòng giữa thẻ mở và đóng, nhưng điều này chỉ được hiển thị trong các trình duyệt không hỗ trợ `<iframe>`, không phải khi hình ảnh tải thất bại.
- Hơn nữa, trừ khi SVG và trang web hiện tại của bạn có cùng {{glossary('origin')}}, bạn không thể sử dụng JavaScript trên trang web chính của mình để thao tác SVG.

## Khám phá SVG

Trong bài tập này, chúng tôi muốn bạn thử nghiệm với SVG. Nhấn nút **Play** để mở ví dụ tiếp theo trong MDN Playground và chỉnh sửa ở đó.

Hãy truy cập [Tham chiếu phần tử SVG](/en-US/docs/Web/SVG/Reference/Element) để xem những phần tử nào khác bạn có thể sử dụng mang lại nhiều chức năng tích hợp.
Có các hình dạng khác bạn có thể thử, như hình elip, hoặc bạn có thể thử nghiệm với [các mẫu](/en-US/docs/Web/SVG/Reference/Element/pattern), hoặc thậm chí [các hiệu ứng bộ lọc](/en-US/docs/Web/SVG/Reference/Element/filter).
Phần này hoàn toàn là về kỹ năng nghiên cứu của bạn, thử điều gì đó mới, và có một chút niềm vui.

Nếu bạn bị kẹt và không thể làm cho mã hoạt động, bạn luôn có thể đặt lại nó bằng cách sử dụng nút _Reset_ trong Playground.

```html live-sample___playing-with-svg
<svg width="100%" height="100%">
  <rect width="100%" height="100%" fill="red" />
  <circle cx="100%" cy="100%" r="150" fill="blue" stroke="black" />
  <polygon points="120,0 240,225 0,225" fill="green" />
  <text
    x="50"
    y="100"
    font-family="Verdana"
    font-size="55"
    fill="white"
    stroke="black"
    stroke-width="2">
    Hello!
  </text>
</svg>
```

{{ EmbedLiveSample('playing-with-SVG', 700, 300) }}

## Tóm tắt

Bài viết này đã cung cấp cho bạn một chuyến tham quan nhanh về đồ họa véc-tơ và SVG là gì, tại sao chúng hữu ích để biết, và cách đưa SVG vào trang web của bạn. Mục đích không bao giờ là hướng dẫn đầy đủ để học SVG, chỉ là một gợi ý để bạn biết SVG là gì nếu bạn gặp nó trong các hành trình xung quanh Web. Vì vậy, đừng lo lắng nếu bạn chưa cảm thấy mình là chuyên gia SVG. Chúng tôi đã bao gồm một số liên kết dưới đây có thể giúp bạn nếu bạn muốn tìm hiểu thêm về cách nó hoạt động.

## Xem thêm

- [Hướng dẫn SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Getting_started) trên MDN
- [Hướng dẫn của Sara Soueidan về hình ảnh SVG responsive](https://tympanus.net/codrops/2014/08/19/making-svgs-responsive-with-css/)
- [Thuộc tính SVG và CSS](https://css-tricks.com/svg-properties-and-css/)
- [Cách mở rộng SVG](https://css-tricks.com/scale-svg/) (không đơn giản như đồ họa raster!)
