---
title: "Clipboard: sự kiện clipboardchange"
slug: Web/API/Clipboard/clipboardchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Clipboard.clipboardchange_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`clipboardchange`** của giao diện {{domxref("Clipboard")}} được kích hoạt khi nội dung clipboard hệ thống thay đổi theo bất kỳ cách nào, ví dụ qua lệnh sao chép của hệ thống, hoặc qua phương thức API như {{domxref("Clipboard.writeText()")}}.

Sự kiện `clipboardchange` chỉ được kích hoạt với [sticky activation](/en-US/docs/Glossary/Sticky_activation) hoặc sau khi quyền `clipboard-read` được cấp.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("clipboardchange", (event) => { })

onclipboardchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("ClipboardChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ClipboardChangeEvent")}}

## Ví dụ

### Lắng nghe lệnh sao chép của hệ thống

Ví dụ này cho thấy cách lắng nghe lệnh sao chép của hệ thống và hiển thị nội dung đã được sao chép vào clipboard.

#### HTML

HTML bao gồm ba phần tử {{htmlelement("p")}} — một để hiển thị nội dung clipboard và hai phần tử chứa văn bản mẫu để sao chép.

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

Trong script, đầu tiên chúng ta lấy tham chiếu đến phần tử `<p>` đầu ra. Sau đó chúng ta định nghĩa trình xử lý sự kiện `clipboardchange` trên đối tượng {{domxref("Clipboard")}} của trình duyệt. Khi sự kiện xảy ra, chúng ta gọi phương thức {{domxref("Clipboard.readText()")}} để đọc văn bản vừa được sao chép vào clipboard. Khi kết quả được trả về, chúng ta đặt nó làm giá trị của `textContent` của đoạn văn đầu ra.

```js live-sample___basic-usage
const outputPara = document.querySelector("#output");

navigator.clipboard.addEventListener("clipboardchange", (event) => {
  navigator.clipboard
    .readText()
    .then((text) => (outputPara.textContent = `Copied text: ${text}`));
});
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("basic-usage", '100%', "350px", "", "", "", "clipboard-read")}}

Hãy thử chọn một số văn bản từ ví dụ và sau đó sao chép nó vào clipboard bằng cách sử dụng <kbd>Ctrl</kbd> + <kbd>C</kbd> (hoặc <kbd>Cmd</kbd> + <kbd>C</kbd> nếu bạn đang sử dụng Mac). Trong lần thử đầu tiên, bạn sẽ thấy một lời nhắc quyền yêu cầu cho phép đọc nội dung clipboard. Sau đó (hoặc ngay lập tức, trong các lần thử tiếp theo), bạn sẽ thấy văn bản bạn đã sao chép được in vào đoạn văn đầu ra ở đầu giao diện.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ClipboardChangeEvent")}}
- [API Clipboard](/en-US/docs/Web/API/Clipboard_API)
