---
title: "CSSContainerRule: thuộc tính containerName"
short-title: containerName
slug: Web/API/CSSContainerRule/containerName
page-type: web-api-instance-property
browser-compat: api.CSSContainerRule.containerName
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`containerName`** của giao diện {{domxref("CSSContainerRule")}} biểu thị tên container của quy tắc at-rule CSS {{cssxref("@container")}} liên kết.

Ví dụ, giá trị của `containerName` cho {{cssxref("@container")}} bên dưới là `sidebar`:

```css
@container sidebar (width >= 700px) {
  .card {
    font-size: 2em;
  }
}
```

## Giá trị

Một chuỗi chứa {{cssxref("container-name")}} của {{cssxref("@container")}} liên kết với {{domxref("CSSContainerRule")}} này. Nếu `@container` không có [tên](/en-US/docs/Web/API/CSSContainerRule#unnamed_container_rule), hàm trả về chuỗi rỗng (`""`).

## Ví dụ

Ví dụ dưới đây định nghĩa một quy tắc {{cssxref("@container")}} có tên, và hiển thị các thuộc tính của {{domxref("CSSContainerRule")}} liên kết. CSS rất giống với ví dụ `@container` [Tạo ngữ cảnh container được đặt tên](/en-US/docs/Web/CSS/Reference/At-rules/@container#creating_named_container_contexts).

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

CSS cho phần tử container chỉ định loại container, và cũng có thể chỉ định tên. Card có cỡ chữ mặc định, được ghi đè cho `@container` tên `sidebar` nếu chiều rộng lớn hơn 700px.

```html
<style id="example-styles">
  .post {
    container-type: inline-size;
    container-name: sidebar;
  }

  /* Default heading styles for the card title */
  .card h2 {
    font-size: 1em;
  }

  @container sidebar (width >= 700px) {
    .card {
      font-size: 2em;
    }
  }
</style>
```

Code dưới đây lấy {{domxref("HTMLStyleElement")}} liên kết với ví dụ bằng `id` của nó, sau đó sử dụng thuộc tính `sheet` để lấy {{domxref("StyleSheet")}}. Từ `StyleSheet`, chúng ta lấy tập hợp `cssRules` được thêm vào sheet. Vì chúng ta đã thêm `@container` làm quy tắc thứ ba ở trên, chúng ta có thể truy cập `CSSContainerRule` liên kết bằng mục nhập thứ ba (chỉ số "2"), trong `cssRules`. Cuối cùng, chúng ta ghi lại các thuộc tính tên container và truy vấn (code thực hiện ghi log không được hiển thị).

```js
const exampleStylesheet = document.getElementById("example-styles").sheet;
const exampleRules = exampleStylesheet.cssRules;
const containerRule = exampleRules[2]; // a CSSContainerRule representing the container rule.
log(`CSSContainerRule.containerName: "${containerRule.containerName}"`);
```

Kết quả ví dụ được hiển thị bên dưới. Phần log liệt kê chuỗi tên container. Tiêu đề trong phần card sẽ tăng gấp đôi kích thước khi chiều rộng của trang vượt qua 700px.

{{EmbedLiveSample("Examples","100%","250px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính viết tắt CSS {{cssxref("container")}}
- [Mô-đun CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [Truy vấn container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Sử dụng truy vấn kích thước và kiểu container](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
