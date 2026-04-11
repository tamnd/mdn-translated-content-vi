---
title: "HTMLImageElement: sizes property"
short-title: sizes
slug: Web/API/HTMLImageElement/sizes
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.sizes
---

{{APIRef("HTML DOM")}}

Thuộc tính **`sizes`** của giao diện {{domxref("HTMLImageElement")}} cho phép bạn chỉ định chiều rộng bố cục của [hình ảnh](/en-US/docs/Web/HTML/Reference/Elements/img) cho mỗi danh sách [truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries). Điều này cung cấp khả năng tự động chọn trong số các hình ảnh khác nhau—thậm chí cả những hình ảnh có hướng hoặc tỷ lệ khung hình khác nhau—khi trạng thái tài liệu thay đổi để phù hợp với các điều kiện phương tiện khác nhau. Nó phản ánh thuộc tính nội dung [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) của phần tử `<img>`.

## Giá trị

Một sợi dây. Để biết thêm thông tin về cú pháp của thuộc tính `sizes`, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes).

## Ví dụ

### Chọn hình ảnh vừa với chiều rộng cửa sổ

Trong ví dụ này, bố cục giống như blog được tạo, hiển thị một số văn bản và hình ảnh có ba điểm kích thước được chỉ định, tùy thuộc vào chiều rộng của cửa sổ. Ba phiên bản của hình ảnh cũng có sẵn với chiều rộng được chỉ định. Trình duyệt lấy tất cả thông tin này và chọn hình ảnh cũng như chiều rộng đáp ứng tốt nhất các giá trị được chỉ định.

Hình ảnh được sử dụng chính xác như thế nào có thể phụ thuộc vào trình duyệt và mật độ điểm ảnh trên màn hình của người dùng.

Các nút ở cuối ví dụ cho phép bạn thực sự sửa đổi thuộc tính `sizes` một chút, chuyển đổi chiều rộng lớn nhất trong ba chiều rộng cho hình ảnh trong khoảng từ 40em đến 50em.

#### HTML

```html
<article>
  <h1>An amazing headline</h1>
  <div class="test"></div>
  <p>
    This is even more amazing content text. It's really spectacular. And
    fascinating. Oh, it's also clever and witty. Award-winning stuff, I'm sure.
  </p>
  <img
    src="new-york-skyline-wide.jpg"
    srcset="
      new-york-skyline-wide.jpg 3724w,
      new-york-skyline-4by3.jpg 1961w,
      new-york-skyline-tall.jpg 1060w
    "
    sizes="(50em <= width <= 60em) 50em,
              (30em <= width < 50em) 30em,
              (width < 30em) 20em"
    alt="The New York City skyline on a beautiful day, with the One World Trade Center building in the middle." />
  <p>
    Then there's even more amazing stuff to say down here. Can you believe it? I
    sure can't.
  </p>

  <button id="break40">Last Width: 40em</button>
  <button id="break50">Last Width: 50em</button>
</article>
```

#### CSS

```css
article {
  margin: 1em;
  max-width: 60em;
  min-width: 20em;
  border: 4em solid #880e4f;
  border-radius: 7em;
  padding: 1.5em;
  font:
    16px "Open Sans",
    "Verdana",
    "Helvetica",
    "Arial",
    sans-serif;
}

article img {
  display: block;
  max-width: 100%;
  border: 1px solid #888888;
  box-shadow: 0 0.5em 0.3em #888888;
  margin-bottom: 1.25em;
}
```

#### JavaScript

Mã JavaScript xử lý hai nút cho phép bạn chuyển đổi tùy chọn chiều rộng thứ ba trong khoảng từ 40em đến 50em; việc này được thực hiện bằng cách xử lý sự kiện {{domxref("Element.click_event", "click")}}, sử dụng phương thức {{jsxref("String.replace", "replace()")}} chuỗi JavaScript để thay thế phần có liên quan của chuỗi `sizes`.

```js
const image = document.querySelector("article img");
const break40 = document.getElementById("break40");
const break50 = document.getElementById("break50");

break40.addEventListener(
  "click",
  () => (image.sizes = image.sizes.replace(/50em,/, "40em,")),
);

break50.addEventListener(
  "click",
  () => (image.sizes = image.sizes.replace(/40em,/, "50em,")),
);
```

#### Kết quả

{{EmbedLiveSample("Selecting an image to fit window width", "", 1050)}}

Trang này tốt nhất là {{LiveSampleLink('Selecting an image to fit window width', 'viewed in its own window')}} nên bạn có thể điều chỉnh kích thước đầy đủ nhé.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries)
- [Sử dụng truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images)
- [Hình ảnh phản hồi](/en-US/docs/Web/HTML/Guides/Responsive_images)
- [Sử dụng thuộc tính `srcset` và `sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#using_the_srcset_and_sizes_attributes)
- {{domxref("HTMLImageElement.currentSrc")}}
- {{domxref("HTMLImageElement.src")}}
- {{domxref("HTMLImageElement.srcset")}}
