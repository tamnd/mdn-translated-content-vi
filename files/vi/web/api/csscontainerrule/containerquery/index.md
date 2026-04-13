---
title: "CSSContainerRule: thuộc tính containerQuery"
short-title: containerQuery
slug: Web/API/CSSContainerRule/containerQuery
page-type: web-api-instance-property
browser-compat: api.CSSContainerRule.containerQuery
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`containerQuery`** của giao diện {{domxref("CSSContainerRule")}} trả về một chuỗi biểu thị các điều kiện container được đánh giá khi container thay đổi kích thước, nhằm xác định xem các kiểu trong {{cssxref("@container")}} liên kết có được áp dụng hay không.

Ví dụ, giá trị của `containerQuery` cho {{cssxref("@container")}} bên dưới là `(width >= 700px)`:

```css
@container sidebar (width >= 700px) {
  .card {
    font-size: 2em;
  }
}
```

## Giá trị

Một chuỗi chứa truy vấn container.

Lưu ý rằng giá trị có thể không giống hệt chuỗi ban đầu, vì có thể xảy ra các chuẩn hóa như loại bỏ khoảng trắng.

## Ví dụ

Ví dụ dưới đây định nghĩa một quy tắc {{cssxref("@container")}} không tên, và hiển thị các thuộc tính của {{domxref("CSSContainerRule")}} liên kết. CSS tương tự như trong ví dụ `@container` [Thiết lập kiểu dựa trên kích thước container](/en-US/docs/Web/CSS/Reference/At-rules/@container#setting_styles_based_on_a_containers_size).

```html hidden
<div id="log">
  <h2>Log</h2>
  <ul></ul>
  <hr />
</div>
```

```js hidden
// Store reference to log list
const logList = document.querySelector("#log ul");
// Function to log data from underlying source
function log(result) {
  const listItem = document.createElement("li");
  listItem.textContent = result;
  logList.appendChild(listItem);
}
```

Đầu tiên chúng ta định nghĩa HTML cho một `card` (`<div>`) được chứa trong một `post`.

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

CSS cho phần tử container chỉ định loại container. {{cssxref("@container")}} sau đó áp dụng chiều rộng, cỡ chữ và màu nền mới cho phần tử được chứa "card" nếu chiều rộng nhỏ hơn 650px.

```html
<style id="example-styles">
  /* A container context based on inline size */
  .post {
    container-type: inline-size;
  }

  /* Apply styles if the container is narrower than 650px */
  @container (width < 650px) {
    .card {
      width: 50%;
      background-color: gray;
      font-size: 1em;
    }
  }
</style>
```

Code dưới đây lấy {{domxref("HTMLStyleElement")}} liên kết với ví dụ bằng id của nó, sau đó sử dụng thuộc tính `sheet` để lấy {{domxref("StyleSheet")}}. Từ `StyleSheet`, chúng ta lấy tập hợp `cssRules` được thêm vào sheet. Vì chúng ta đã thêm `@container` làm quy tắc thứ hai ở trên, chúng ta có thể truy cập `CSSContainerRule` liên kết bằng mục nhập thứ hai (chỉ số "1"), trong `cssRules`. Cuối cùng, chúng ta ghi lại các thuộc tính tên container và truy vấn.

```js
const exampleStylesheet = document.getElementById("example-styles").sheet;
const exampleRules = exampleStylesheet.cssRules;
const containerRule = exampleRules[1]; // a CSSContainerRule representing the container rule.
log(`CSSContainerRule.containerQuery: "${containerRule.containerQuery}"`);
```

Kết quả ví dụ được hiển thị bên dưới. Phần log liệt kê chuỗi truy vấn. Card sẽ thay đổi nền khi chiều rộng của trang chuyển qua 650px.

{{EmbedLiveSample("Examples","100%","250px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô-đun CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [Truy vấn container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Sử dụng truy vấn kích thước và kiểu container](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
