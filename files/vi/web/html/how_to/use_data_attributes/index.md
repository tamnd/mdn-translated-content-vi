---
title: Use data attributes
slug: Web/HTML/How_to/Use_data_attributes
page-type: how-to
sidebar: htmlsidebar
---

HTML được thiết kế với tính mở rộng cho dữ liệu cần liên kết với một phần tử cụ thể nhưng không cần có bất kỳ ý nghĩa được xác định nào. [Thuộc tính `data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) cho phép chúng ta lưu trữ thông tin bổ sung trên các phần tử HTML ngữ nghĩa tiêu chuẩn mà không có các cách làm không chuẩn khác như các thuộc tính không tiêu chuẩn, hoặc các thuộc tính bổ sung trên DOM.

## Cú pháp HTML

Cú pháp rất đơn giản. Bất kỳ thuộc tính nào trên bất kỳ phần tử nào có tên thuộc tính bắt đầu bằng `data-` là thuộc tính data. Giả sử bạn có một số bài viết và bạn muốn lưu trữ một số thông tin bổ sung không có biểu diễn trực quan. Chỉ cần sử dụng thuộc tính `data` cho điều đó:

```html
<main>
  <article
    id="electric-cars"
    data-columns="3"
    data-index-number="12314"
    data-parent="cars">
    <!-- Electric car content -->
  </article>

  <article
    id="solar-cars"
    data-columns="3"
    data-index-number="12315"
    data-parent="cars">
    <!-- Solar car content -->
  </article>

  <article
    id="flying-cars"
    data-columns="4"
    data-index-number="12316"
    data-parent="cars">
    <!-- Flying car content -->
  </article>
</main>
```

## Truy cập JavaScript

Đọc các giá trị của các thuộc tính này trong [JavaScript](/en-US/docs/Web/JavaScript) cũng rất đơn giản. Bạn có thể sử dụng {{domxref("Element.getAttribute", "getAttribute()")}} với tên HTML đầy đủ của chúng để đọc, nhưng tiêu chuẩn định nghĩa một cách đơn giản hơn: một {{domxref("DOMStringMap")}} bạn có thể đọc thông qua thuộc tính {{domxref("HTMLElement/dataset", "dataset")}}.

Để lấy thuộc tính `data` thông qua đối tượng `dataset`, hãy lấy thuộc tính theo phần tên thuộc tính sau `data-` (lưu ý rằng dấu gạch ngang được chuyển đổi thành {{Glossary("camel_case", "camel case")}}).

```js
const article = document.querySelector("#electric-cars");
// The following would also work:
// const article = document.getElementById("electric-cars")

article.dataset.columns; // "3"
article.dataset.indexNumber; // "12314"
article.dataset.parent; // "cars"
```

Mỗi thuộc tính là một chuỗi và có thể được đọc và ghi. Trong trường hợp trên, đặt `article.dataset.columns = 5` sẽ thay đổi thuộc tính đó thành `"5"`.

Bạn cũng có thể sử dụng [`document.querySelector()`](/en-US/docs/Web/API/Document/querySelector) hoặc [`document.querySelectorAll()`](/en-US/docs/Web/API/Document/querySelectorAll) với các selector thuộc tính data để tìm một phần tử hoặc tất cả các phần tử khớp:

```js
// Find all elements with a data-columns attribute
const articles = document.querySelectorAll("[data-columns]");

// Find all elements with data-columns="3"
const threeColumnArticles = document.querySelectorAll('[data-columns="3"]');
// You can then iterate over the results
threeColumnArticles.forEach((article) => {
  console.log(article.dataset.indexNumber);
});
```

## Truy cập CSS

Lưu ý rằng, vì các thuộc tính data là các thuộc tính HTML thuần túy, bạn thậm chí có thể truy cập chúng từ [CSS](/en-US/docs/Web/CSS). Ví dụ, để hiển thị dữ liệu cha trên bài viết, bạn có thể sử dụng [generated content](/en-US/docs/Web/CSS/Reference/Properties/content) trong CSS với hàm {{cssxref("attr()")}}:

```css
article::before {
  content: attr(data-parent);
}
```

Bạn cũng có thể sử dụng [attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) trong CSS để thay đổi kiểu dáng theo dữ liệu:

```css
article[data-columns="3"] {
  width: 400px;
}
article[data-columns="4"] {
  width: 600px;
}
```

Các giá trị data là chuỗi. Các giá trị số phải được trích dẫn trong selector để kiểu dáng có hiệu lực.

## Ví dụ

### Biến thể kiểu dáng

Hãy tưởng tượng bạn có một lớp `callout`. Bây giờ bạn muốn triển khai các biến thể khác nhau, như "note" và "warning". Theo truyền thống, mọi người chỉ sử dụng các tên lớp khác nhau.

```html
<div class="callout callout--note">...</div>
<div class="callout callout--warning">...</div>
```

```css
.callout {
  margin: 0.5em 0;
  padding: 0.5em;
  border-radius: 4px;
  border-width: 2px;
  border-style: solid;
}

.callout--note {
  border-color: rgb(15 15 235);
  background-color: rgb(15 15 235 / 0.2);
}
.callout--warning {
  border-color: rgb(235 15 15);
  background-color: rgb(235 15 15 / 0.2);
}
```

Với thuộc tính data, đây là một giải pháp thay thế bạn có thể xem xét:

```html live-sample___callout-data-attr
<div class="callout">...</div>
<div class="callout" data-variant="note">...</div>
<div class="callout" data-variant="warning">...</div>
```

```css live-sample___callout-data-attr
.callout {
  margin: 0.5em 0;
  padding: 0.5em;
  border-radius: 4px;
  border-width: 2px;
  border-style: solid;
}

/* Default style */
.callout:not([data-variant]) {
  border-color: rgb(15 15 15);
  background-color: rgb(15 15 15 / 0.2);
}
.callout[data-variant="note"] {
  border-color: rgb(15 15 235);
  background-color: rgb(15 15 235 / 0.2);
}
.callout[data-variant="warning"] {
  border-color: rgb(235 15 15);
  background-color: rgb(235 15 15 / 0.2);
}
```

{{EmbedLiveSample("callout-data-attr", "", "200")}}

Có nhiều lợi ích của điều này:

- Nó loại bỏ nhiều trạng thái không hợp lệ, chẳng hạn như áp dụng `callout--note` mà không thêm `callout`, hoặc áp dụng nhiều biến thể cùng một lúc.
- Thuộc tính `data-variant` riêng biệt cho phép phân tích tĩnh các giá trị hợp lệ thông qua linting hoặc kiểm tra kiểu.
- Chuyển đổi biến thể trực quan hơn: bạn có thể sử dụng `div.dataset.variant = "warning";` thay vì thao tác [`classList`](/en-US/docs/Web/API/Element/classList) yêu cầu nhiều bước.

### Liên kết dữ liệu tùy ý với các phần tử DOM

Nhiều ứng dụng web có dữ liệu JavaScript làm nguồn sự thật cho trạng thái UI của chúng. Trong những trường hợp này, bạn chỉ thêm các thuộc tính HTML cần thiết để render. Các thuộc tính data hữu ích trong các trường hợp mọi thứ đều hiện diện trong markup và JavaScript chỉ cần thiết để xử lý sự kiện, đồng bộ trạng thái, v.v.

Ví dụ, trong ví dụ [carousel with scroll margin](/en-US/docs/Web/API/IntersectionObserver/scrollMargin#carousel_with_scroll_margin) của chúng ta, chúng ta có một trang HTML đã được điền sẵn với nhiều phần tử `<img>`. Nguồn hình ảnh ban đầu được lưu trữ trong `data-src` để ngăn bất kỳ yêu cầu nào được kích hoạt, và `src` thực sự chỉ được thêm khi `<img>` cuộn vào tầm nhìn. Dữ liệu (nguồn hình ảnh) được đặt cùng với phần tử, và JavaScript chỉ chịu trách nhiệm định nghĩa hành vi.

## Vấn đề

Không lưu trữ nội dung cần hiển thị và truy cập được trong các thuộc tính data, vì công nghệ hỗ trợ có thể không truy cập được chúng. Ngoài ra, các web crawler có thể không lập chỉ mục các giá trị của thuộc tính data. Thường thì nếu bạn chỉ muốn thuộc tính data được hiển thị, bạn có thể trực tiếp thao tác [`textContent`](/en-US/docs/Web/API/Node/textContent).

## Xem thêm

- Bài viết này được chuyển thể từ [Using data attributes in JavaScript and CSS on hacks.mozilla.org](https://hacks.mozilla.org/2012/10/using-data-attributes-in-javascript-and-css/).
- Các thuộc tính tùy chỉnh cũng được hỗ trợ trong SVG 2; xem {{domxref("HTMLElement.dataset")}} và {{SVGAttr("data-*")}} để biết thêm thông tin.
- [How to use HTML data attributes](https://www.sitepoint.com/how-why-use-html5-custom-data-attributes/) (Sitepoint)
