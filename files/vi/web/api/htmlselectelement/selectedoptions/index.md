---
title: "HTMLSelectElement: thuộc tính selectedOptions"
short-title: selectedOptions
slug: Web/API/HTMLSelectElement/selectedOptions
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.selectedOptions
---

{{APIRef("HTML DOM")}}

Thuộc tính **chỉ đọc** {{domxref("HTMLSelectElement")}} **`selectedOptions`** chứa danh sách các phần tử {{HTMLElement("option")}} nằm trong phần tử {{HTMLElement("select")}} hiện đang được chọn. Danh sách các option đã chọn là một đối tượng {{domxref("HTMLCollection")}} với một mục cho mỗi option hiện được chọn.

Một option được xem là đã chọn nếu nó có thuộc tính {{domxref("HTMLOptionElement.selected")}}.

## Giá trị

Một {{domxref("HTMLCollection")}} liệt kê mọi {{domxref("HTMLOptionElement")}} hiện được chọn, là phần tử con của {{domxref("HTMLSelectElement")}} hoặc của một {{domxref("HTMLOptGroupElement")}} trong phần tử `<select>`.

Nói cách khác, bất kỳ option nào nằm trong phần tử `<select>` đều có thể thuộc kết quả, nhưng các nhóm option không được bao gồm trong danh sách.

Nếu không có option nào hiện được chọn, tập hợp sẽ rỗng và trả về {{domxref("HTMLCollection.length", "length")}} bằng 0.

## Ví dụ

Trong ví dụ này, một phần tử {{HTMLElement("select")}} với nhiều option được dùng để cho phép người dùng đặt món ăn.

### HTML

HTML tạo hộp chọn và các phần tử {{HTMLElement("option")}} đại diện cho từng món ăn trông như sau:

```html
<label for="foods">What do you want to eat?</label><br />
<select id="foods" name="foods" size="7" multiple>
  <option value="1">Burrito</option>
  <option value="2">Cheeseburger</option>
  <option value="3">Double Bacon Burger Supreme</option>
  <option value="4">Pepperoni Pizza</option>
  <option value="5">Taco</option>
</select>
<br />
<button name="order" id="order">Order Now</button>
<p id="output"></p>
```

Phần tử `<select>` được đặt để cho phép chọn nhiều mục và cao 7 hàng. Cũng lưu ý phần tử {{HTMLElement("button")}}, nhiệm vụ của nó là kích hoạt việc lấy {{domxref("HTMLCollection")}} của các phần tử đã chọn bằng thuộc tính `selected`.

### JavaScript

Mã JavaScript thiết lập trình xử lý sự kiện cho nút, cũng như chính trình xử lý đó, trông như sau:

```js
let orderButton = document.getElementById("order");
let itemList = document.getElementById("foods");
let outputBox = document.getElementById("output");

orderButton.addEventListener("click", () => {
  let collection = itemList.selectedOptions;
  let output = "";

  for (let i = 0; i < collection.length; i++) {
    if (output === "") {
      output = "Your order for the following items has been placed: ";
    }
    output += collection[i].label;

    if (i === collection.length - 2 && collection.length < 3) {
      output += " and ";
    } else if (i < collection.length - 2) {
      output += ", ";
    } else if (i === collection.length - 2) {
      output += ", and ";
    }
  }

  if (output === "") {
    output = "You didn't order anything!";
  }

  outputBox.textContent = output;
});
```

Script này thiết lập một trình nghe sự kiện {{domxref("Element/click_event", "click")}} trên nút "Order Now". Khi được nhấp, trình xử lý sự kiện sẽ lấy danh sách các option được chọn bằng `selectedOptions`, rồi lặp qua các option trong danh sách. Một chuỗi được xây dựng để liệt kê các mục đã đặt, với logic tạo danh sách theo đúng quy tắc ngữ pháp tiếng Anh (bao gồm [serial comma](https://en.wikipedia.org/wiki/Serial_comma)).

### Kết quả

Nội dung tạo ra sẽ trông như sau khi hoạt động:

{{EmbedLiveSample("Examples", 600, 250)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Drop-down controls](/en-US/docs/Learn_web_development/Extensions/Forms/Other_form_controls#drop-down_controls)
