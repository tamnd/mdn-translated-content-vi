---
title: "HTMLElement: thuộc tính hidden"
short-title: hidden
slug: Web/API/HTMLElement/hidden
page-type: web-api-instance-property
browser-compat: api.HTMLElement.hidden
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`hidden`** của {{domxref("HTMLElement")}} phản ánh giá trị của thuộc tính [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden) của phần tử.

## Giá trị

Thuộc tính này có thể có một trong ba giá trị:

- `true`
  - : Phần tử bị ẩn.
- `false`
  - : Phần tử không bị ẩn. Đây là giá trị mặc định của thuộc tính.
- `"until-found"`
  - : Phần tử bị _ẩn cho đến khi tìm thấy_, nghĩa là nó bị ẩn nhưng sẽ được hiển thị nếu được tìm thấy thông qua tìm kiếm trong trang hoặc được truy cập qua điều hướng phân mảnh.

Để biết chi tiết về cách sử dụng thuộc tính này, hãy xem trang dành cho thuộc tính HTML [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden) mà thuộc tính này phản ánh.

## Ví dụ

Đây là ví dụ khi một khối ẩn được dùng để chứa thông điệp 'cảm ơn' được hiển thị sau khi người dùng đồng ý với một yêu cầu bất thường.

### HTML

HTML chứa hai bảng: bảng chào mừng yêu cầu người dùng đồng ý tuyệt vời, và bảng tiếp theo ban đầu bị ẩn.

```html
<div id="welcome" class="panel">
  <h1>Welcome to my website!</h1>
  <p>By clicking "OK" you agree to be awesome today!</p>
  <button class="button" id="okButton">OK</button>
</div>

<div id="awesome" class="panel" hidden>
  <h1>Thanks!</h1>
  <p>Thanks for agreeing to be awesome today!</p>
</div>
```

### CSS

Nội dung được tạo kiểu bằng CSS bên dưới.

```css
.panel {
  font:
    16px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
  border: 1px solid #2222dd;
  padding: 12px;
  width: 500px;
  text-align: center;
}

.button {
  font:
    22px "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 5px 36px;
}

h1 {
  margin-top: 0;
  font-size: 175%;
}
```

### JavaScript

JavaScript thêm trình lắng nghe sự kiện vào nút "OK", ẩn bảng "welcome" và hiển thị bảng "awesome":

```js
document.getElementById("okButton").addEventListener("click", () => {
  document.getElementById("welcome").hidden = true;
  document.getElementById("awesome").hidden = false;
});
```

### Kết quả

{{ EmbedLiveSample('Examples', 560, 200) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [hidden](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden)
- {{cssxref("display")}}
