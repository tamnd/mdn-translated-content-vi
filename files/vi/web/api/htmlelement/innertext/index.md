---
title: "HTMLElement: thuộc tính innerText"
short-title: innerText
slug: Web/API/HTMLElement/innerText
page-type: web-api-instance-property
browser-compat: api.HTMLElement.innerText
---

{{APIRef("HTML DOM")}}

Thuộc tính **`innerText`** của giao diện {{domxref("HTMLElement")}} biểu thị nội dung văn bản được hiển thị của một nút và các con của nó.

Khi dùng làm getter, nó ước tính văn bản mà người dùng nhận được nếu họ bôi đen nội dung phần tử bằng con trỏ rồi sao chép vào clipboard.
Khi dùng làm setter, nó sẽ thay thế các con của phần tử bằng giá trị đã cho, chuyển đổi bất kỳ xuống dòng nào thành các phần tử {{HTMLElement("br")}}.

> [!NOTE]
> `innerText` dễ bị nhầm lẫn với {{domxref("Node.textContent")}}, nhưng có những khác biệt quan trọng giữa hai thuộc tính.
> Về cơ bản, `innerText` nhận biết giao diện được hiển thị của văn bản, trong khi `textContent` thì không.

## Giá trị

Một chuỗi đại diện cho nội dung văn bản được hiển thị của phần tử.

Nếu bản thân phần tử không [đang được hiển thị](https://html.spec.whatwg.org/multipage/rendering.html#being-rendered) (ví dụ: đã bị tách khỏi tài liệu hoặc bị ẩn khỏi tầm nhìn), giá trị trả về giống như thuộc tính {{domxref("Node.textContent")}}.

> [!WARNING]
> Đặt `innerText` trên một nút sẽ xóa _tất cả_ các con của nút và thay thế chúng bằng một nút văn bản duy nhất với giá trị chuỗi đã cho.

## Ví dụ

Ví dụ này so sánh `innerText` với {{domxref("Node.textContent")}}.
Lưu ý cách `innerText` nhận biết các phần tử như {{htmlElement("br")}} và bỏ qua các phần tử ẩn.

### HTML

```html
<h3>Source element:</h3>
<p id="source">
  <style>
    #source {
      color: red;
    }
    #text {
      text-transform: uppercase;
    }
  </style>
  <span id="text">
    Take a look at<br />
    how this text<br />
    is interpreted below.
  </span>
  <span style="display:none">HIDDEN TEXT</span>
</p>
<h3>Result of textContent:</h3>
<textarea id="textContentOutput" rows="18" cols="40" readonly>…</textarea>
<h3>Result of innerText:</h3>
<textarea id="innerTextOutput" rows="6" cols="40" readonly>…</textarea>
```

### JavaScript

```js
const source = document.getElementById("source");
const textContentOutput = document.getElementById("textContentOutput");
const innerTextOutput = document.getElementById("innerTextOutput");

textContentOutput.value = source.textContent;
innerTextOutput.value = source.innerText;
```

### Kết quả

{{EmbedLiveSample("Examples", 700, 650)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.innerText")}}
- {{domxref("HTMLElement.outerText")}}
- {{domxref("Element.innerHTML")}}
