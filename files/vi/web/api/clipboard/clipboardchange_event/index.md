---
title: "Clipboard: sự kiện clipboardchange"
slug: Web/API/Clipboard/clipboardchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Clipboard.clipboardchange_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`clipboardchange`** của giao diện {{domxref("Clipboard")}} được kích hoạt khi nội dung bảng nhớ tạm hệ thống thay đổi theo bất kỳ cách nào, ví dụ thông qua lệnh sao chép của hệ thống hoặc qua một phương thức API như {{domxref("Clipboard.writeText()")}}.

Sự kiện `clipboardchange` chỉ được kích hoạt khi có [sticky activation](/en-US/docs/Glossary/Sticky_activation) hoặc sau khi quyền `clipboard-read` được cấp.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("clipboardchange", (event) => { })

onclipboardchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("ClipboardChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ClipboardChangeEvent")}}

## Ví dụ

### Lắng nghe các lệnh sao chép của hệ thống

Ví dụ này cho thấy cách lắng nghe các lệnh sao chép của hệ thống và hiển thị nội dung đã được sao chép vào bảng nhớ tạm.

#### HTML

Phần HTML gồm ba phần tử {{htmlelement("p")}}: một phần tử để hiển thị nội dung bảng nhớ tạm và hai phần tử chứa văn bản mẫu để sao chép.

```html live-sample___basic-usage
<p id="output">Văn bản đã sao chép:</p>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a mattis purus.
  Donec at ipsum libero. Maecenas at dictum turpis. Vivamus eget aliquet augue.
  Aenean tempor dictum posuere. Vestibulum vehicula, nulla ac convallis feugiat,
  tortor velit lobortis est, vitae convallis velit libero vel urna. Suspendisse
  potenti. In bibendum ex et pellentesque gravida. Phasellus magna risus,
  euismod vitae sem in, viverra venenatis lacus. Sed dignissim risus eu congue
  consequat. Vestibulum nec feugiat libero. Maecenas quis sodales lorem, eu
  luctus nisl. Cras vel diam sed lacus finibus elementum sed sed nunc.
</p>

<p>
  Nam ac metus eget est bibendum pulvinar. Nunc a venenatis lorem. Lorem ipsum
  dolor sit amet, consectetur adipiscing elit. In dignissim, arcu ornare luctus
  pharetra, dui velit faucibus leo, ac posuere ipsum risus vel ligula. Morbi
  varius, felis et ornare efficitur, tortor erat imperdiet lacus, non rhoncus
  lectus sapien sit amet augue. Suspendisse potenti. Sed fringilla mi augue, at
  laoreet felis varius in. Donec venenatis gravida lacus ut rutrum. Donec
  suscipit egestas justo. Proin semper nibh tortor, sit amet elementum metus
  placerat quis. Sed consectetur leo sed lorem varius, sit amet ultrices sem
  tincidunt. Vivamus facilisis at velit eget commodo.
</p>
```

```css hidden live-sample___basic-usage
body {
  margin: 0 5px;
}
#output {
  font-family: "Helvetica", "Arial";
  padding: 10px;
  border: 2px solid #cccccc;
  border-radius: 5px;
}
```

#### JavaScript

Trong đoạn mã, trước tiên chúng ta lấy tham chiếu đến phần tử `<p>` đầu ra. Sau đó, chúng ta định nghĩa trình xử lý sự kiện `clipboardchange` trên đối tượng {{domxref("Clipboard")}} của trình duyệt. Khi sự kiện được kích hoạt, chúng ta gọi phương thức {{domxref("Clipboard.readText()")}} để đọc văn bản vừa được sao chép vào bảng nhớ tạm. Khi kết quả được trả về, chúng ta gán nó làm giá trị `textContent` của đoạn văn đầu ra.

```js live-sample___basic-usage
const outputPara = document.querySelector("#output");

navigator.clipboard.addEventListener("clipboardchange", (event) => {
  navigator.clipboard
    .readText()
    .then((text) => (outputPara.textContent = `Văn bản đã sao chép: ${text}`));
});
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{EmbedLiveSample("basic-usage", '100%', "350px", "", "", "", "clipboard-read")}}

Hãy thử chọn một đoạn văn bản trong ví dụ rồi sao chép nó vào bảng nhớ tạm bằng <kbd>Ctrl</kbd> + <kbd>C</kbd> (hoặc <kbd>Cmd</kbd> + <kbd>C</kbd> nếu bạn dùng máy Mac). Ở lần đầu tiên, bạn sẽ thấy lời nhắc cấp quyền để cho phép đọc nội dung bảng nhớ tạm. Sau đó (hoặc ngay lập tức ở các lần tiếp theo), bạn sẽ thấy văn bản đã sao chép được in ra ở đoạn văn đầu ra phía trên giao diện.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ClipboardChangeEvent")}}
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
