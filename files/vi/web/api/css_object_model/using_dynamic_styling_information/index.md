---
title: Using dynamic styling information
slug: Web/API/CSS_Object_Model/Using_dynamic_styling_information
page-type: guide
---

{{DefaultAPISidebar("CSSOM")}}

Mô hình đối tượng CSS (CSSOM), một phần của DOM, hiển thị các giao diện cụ thể cho phép thao tác với một lượng lớn thông tin liên quan đến CSS. Ban đầu được định nghĩa trong đề xuất _DOM Kiểu cấp 2_, những giao diện này giờ đây tạo thành một đặc tả, _CSS Mô hình đối tượng (CSSOM)_ nhằm mục đích thay thế nó.

Trong nhiều trường hợp, và khi có thể, cách tốt nhất là thao tác linh hoạt các lớp thông qua thuộc tính {{ domxref("element.className", "className") }} vì hình thức cuối cùng của tất cả các móc định kiểu có thể được kiểm soát trong một biểu định kiểu duy nhất. Mã JavaScript của một người cũng trở nên sạch hơn vì thay vì tập trung vào các chi tiết tạo kiểu, nó có thể tập trung vào ngữ nghĩa tổng thể của từng phần mà nó đang tạo hoặc thao tác, để lại các chi tiết kiểu chính xác cho biểu định kiểu. Tuy nhiên, có những trường hợp trong đó việc thu thập hoặc thao tác các quy tắc thực sự có thể hữu ích (dù cho toàn bộ biểu định kiểu hay các phần tử riêng lẻ) và điều đó được mô tả chi ti��t hơn bên dưới. Cũng lưu ý rằng, như với các kiểu DOM của từng thành phần riêng lẻ, khi nói đến việc thao tác các bảng định kiểu, đây thực sự không phải là thao tác (các) tài liệu vật lý, mà chỉ đơn thuần là sự thể hiện bên trong của tài liệu.

Đối tượng `style` cơ bản hiển thị các giao diện {{domxref("Stylesheet")}} và {{domxref("CSSStylesheet")}}. Những giao diện này chứa các thành phần như `insertRule`, `selectorText`, và `parentStyleSheet` để truy cập và thao tác với các quy tắc kiểu riêng lẻ tạo nên một biểu định kiểu CSS.

Để truy cập các đối tượng `style` từ `document`, bạn có thể sử dụng thuộc tính {{domxref("Document.styleSheets")}} và truy cập các đối tượng riêng lẻ theo chỉ mục (ví dụ, `document.styleSheets[0]` là biểu định kiểu đầu tiên được xác định cho tài liệu, v.v.). Bạn cũng có thể truy cập thuộc tính {{domxref("HTMLStyleElement.sheet", "sheet")}} trên một phần tử `<style>` cụ thể để lấy đối tượng biểu định kiểu liên quan của nó.

## Sửa đổi quy tắc biểu định kiểu bằng CSSOM

Trong ví dụ này, nền của trang được đặt thành `red` bằng cách sử dụng CSS. JavaScript sau đó truy cập vào thuộc tính bằng CSSOM và thay đổi nền thành `cornflowerblue`.

```html live-sample___modify-rule
<p>The stylesheet declaration for the body is modified via JavaScript.</p>
```

```css live-sample___modify-rule
body {
  background-color: red;
  font: 1.2em / 1.5 sans-serif;
  color: white;
  padding: 1em;
}
```

```js live-sample___modify-rule
const stylesheet = document.getElementById("css-output").sheet;
stylesheet.cssRules[0].style.backgroundColor = "cornflowerblue";
```

{{EmbedLiveSample("modify-rule")}}

Danh sách các thuộc tính có sẵn trong DOM từ thuộc tính `style` được đưa ra trên trang [DOM CSS Danh sách thuộc tính](/en-US/docs/Web/CSS/Reference).

Để sửa đổi kiểu cho một tài liệu bằng cú pháp CSS, người ta có thể chèn các quy tắc hoặc chèn các thẻ {{HTMLElement("style")}} có thuộc tính `innerHTML` được đặt thành CSS mong muốn.

## Sửa đổi kiểu của một phần tử

Thuộc tính phần tử {{domxref("HTMLElement.style", "style")}} (xem thêm phần "DOM Style Object" bên dưới) cũng có thể được sử dụng để lấy và thiết lập kiểu trên một phần tử. Tuy nhiên, thuộc tính này chỉ trả về các thuộc tính kiểu đã được thiết lập _in-line_ (ví dụ, truy cập `element.style.color` trên một phần tử được xác định là `<td style="background-color: lightblue">` trả về chuỗi `""`, mặc dù phần tử đó có thể có `color` được khai báo thông qua một biểu định kiểu).

Ngoài ra, khi bạn đặt thuộc tính này trên một phần tử, bạn sẽ ghi đè bất kỳ kiểu nào đã được đặt ở nơi khác cho thuộc tính cụ thể của phần tử đó mà bạn đang đặt. Ví dụ: thiết lập thuộc tính `border` sẽ ghi đè các cài đặt được thực hiện ở nơi khác cho thuộc tính `border` của phần tử đó trong phần đầu hoặc các biểu định kiểu bên ngoài. Tuy nhiên, điều này sẽ không ảnh hưởng đến bất kỳ khai báo thuộc tính nào khác cho kiểu của phần tử đó, chẳng hạn như phần đệm, lề hoặc phông chữ chẳng hạn.

Để thay đổi kiểu của một thành phần cụ thể, bạn có thể điều chỉnh ví dụ sau cho (các) thành phần bạn muốn tạo kiểu.

```html
<p id="p1">Click here to change background color.</p>
<button>Reset background color</button>
```

```css
#p1 {
  border: solid blue 2px;
}
```

```js
const p1 = document.getElementById("p1");
const button = document.querySelector("button");

p1.addEventListener("click", () => {
  p1.style.background = "green";
});
button.addEventListener("click", () => {
  p1.style.background = "white";
});
```

{{ EmbedLiveSample('Modify_an_elements_style') }}

Phương thức {{domxref("window.getComputedStyle", "getComputedStyle()")}} trên đối tượng `document.defaultView` trả về tất cả các kiểu đã được tính toán thực sự cho một phần tử.

### Sử dụng phương thức setAttribution

Lưu ý rằng bạn cũng có thể thay đổi kiểu dáng của một phần tử bằng cách lấy tham chiếu đến nó và sau đó sử dụng phương thức [`setAttribute`](/en-US/docs/Web/API/Element/setAttribute) của nó để chỉ định thuộc tính CSS và giá trị của nó.

```js
const el = document.getElementById("some-element");
el.setAttribute("style", "background-color:darkblue;");
```

Tuy nhiên, hãy lưu ý rằng `setAttribute` loại bỏ tất cả các thuộc tính `style` khác có thể đã được xác định trong đối tượng `style` của phần tử. Nếu phần tử `some-element` ở trên có thuộc tính `style` nội tuyến chẳng hạn như `style="font-size: 18px"`, thì giá trị đó sẽ bị loại bỏ bằng cách sử dụng `setAttribute`.
