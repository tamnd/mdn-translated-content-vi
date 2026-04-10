---
title: "Event: thuộc tính defaultPrevented"
short-title: defaultPrevented
slug: Web/API/Event/defaultPrevented
page-type: web-api-instance-property
browser-compat: api.Event.defaultPrevented
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`defaultPrevented`** của giao diện {{domxref("Event")}} trả về một giá trị boolean cho biết lời gọi đến {{ domxref("Event.preventDefault()") }} có hủy sự kiện hay không.

## Giá trị

Một giá trị boolean, trong đó `true` cho biết hành động mặc định của {{glossary("user agent")}} đã bị ngăn, và `false` cho biết điều đó chưa xảy ra.

## Ví dụ

Ví dụ này ghi lại các lần cố truy cập vào các liên kết từ hai phần tử {{htmlElement("a")}}. JavaScript được dùng để ngăn liên kết thứ hai hoạt động.

### HTML

```html
<p><a id="link1" href="#link1">Truy cập liên kết 1</a></p>
<p><a id="link2" href="#link2">Thử truy cập liên kết 2</a> (bạn không thể)</p>
<p id="log"></p>
```

### JavaScript

```js
function stopLink(event) {
  event.preventDefault();
}

function logClick(event) {
  const log = document.getElementById("log");

  if (event.target.tagName === "A") {
    log.innerText = event.defaultPrevented
      ? `Xin lỗi, nhưng bạn không thể truy cập liên kết này!\n${log.innerText}`
      : `Đang truy cập liên kết…\n${log.innerText}`;
  }
}

const a = document.getElementById("link2");
a.addEventListener("click", stopLink);
document.addEventListener("click", logClick);
```

### Kết quả

{{EmbedLiveSample("Example")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
