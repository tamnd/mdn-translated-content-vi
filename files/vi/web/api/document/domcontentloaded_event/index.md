---
title: "Document: sự kiện DOMContentLoaded"
short-title: DOMContentLoaded
slug: Web/API/Document/DOMContentLoaded_event
page-type: web-api-event
browser-compat: api.Document.DOMContentLoaded_event
---

{{APIRef("DOM")}}

Sự kiện **`DOMContentLoaded`** được kích hoạt khi tài liệu HTML đã được phân tích cú pháp hoàn tất và tất cả các tập lệnh defer ([`<script defer src="…">`](/en-US/docs/Web/HTML/Reference/Elements/script#defer) và [`<script type="module">`](/en-US/docs/Web/HTML/Reference/Elements/script#module)) đã được tải xuống và thực thi. Sự kiện này không chờ các tài nguyên khác như hình ảnh, subframe và các tập lệnh async hoàn tất tải.

`DOMContentLoaded` không chờ các stylesheet tải, tuy nhiên các tập lệnh defer _có_ chờ stylesheet và sự kiện `DOMContentLoaded` được xếp hàng sau các tập lệnh defer. Ngoài ra, các tập lệnh không phải defer hoặc async (ví dụ: `<script>`) sẽ chờ các stylesheet đã được phân tích cú pháp tải xong.

Một sự kiện khác, {{domxref("Window/load_event", "load")}}, chỉ nên được sử dụng để phát hiện trang đã tải hoàn tất. Một lỗi phổ biến là sử dụng `load` trong khi `DOMContentLoaded` phù hợp hơn.

Thông thường, để tránh chạy tập lệnh trước khi DOM mà nó thao tác được xây dựng đầy đủ, bạn có thể đặt tập lệnh ở cuối phần body của tài liệu, ngay trước thẻ đóng `</body>`, mà không cần bọc nó trong trình lắng nghe sự kiện.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}.

```js-nolint
addEventListener("DOMContentLoaded", (event) => { })
```

> [!NOTE]
> Không có thuộc tính trình xử lý sự kiện `onDOMContentLoaded` cho sự kiện này.

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Cách sử dụng cơ bản

```js
document.addEventListener("DOMContentLoaded", (event) => {
  console.log("DOM đã tải và phân tích cú pháp hoàn tất");
});
```

### Trì hoãn DOMContentLoaded

```html
<script>
  document.addEventListener("DOMContentLoaded", (event) => {
    console.log("DOM đã tải và phân tích cú pháp hoàn tất");
  });

  for (let i = 0; i < 1_000_000_000; i++);
  // Tập lệnh đồng bộ này sẽ trì hoãn việc phân tích cú pháp DOM,
  // do đó sự kiện DOMContentLoaded sẽ được kích hoạt muộn hơn.
</script>
```

### Kiểm tra xem việc tải đã hoàn tất chưa

Đôi khi tập lệnh của bạn có thể chạy sau khi sự kiện `DOMContentLoaded` đã được kích hoạt. Điều này thường xảy ra khi tập lệnh chạy không đồng bộ. Các tình huống phổ biến bao gồm:

- Một mô-đun được nhập động sau khi tài liệu đã tải xong.
- Một tập lệnh được include qua `<script async>`.
- Một tập lệnh được chèn động vào trang.
- Mã tiếp tục chạy sau một thao tác không đồng bộ, chẳng hạn như `await fetch(...)`, bao gồm cả sau await cấp cao nhất trong một mô-đun.

Trong những trường hợp này, bạn nên kiểm tra `readyState` của tài liệu trước khi thêm trình lắng nghe `DOMContentLoaded`, nếu không logic thiết lập của bạn có thể không được thực thi. Đối với các tập lệnh đồng bộ (không có `async`) đã có sẵn trong markup ban đầu, tình huống này không xảy ra. Tài liệu sẽ chờ tập lệnh thực thi trước khi kích hoạt `DOMContentLoaded`, vì vậy bạn luôn chắc chắn rằng logic thiết lập trong trình lắng nghe sẽ được thực thi.

Xem xét tệp tập lệnh sau một cách độc lập:

```js
function doSomething() {
  console.info("DOM đã tải");
}

if (document.readyState === "loading") {
  // Quá trình tải vẫn chưa hoàn tất
  document.addEventListener("DOMContentLoaded", doSomething);
} else {
  // `DOMContentLoaded` đã được kích hoạt trước đó
  doSomething();
}
```

Tập lệnh không thể kiểm soát cách nó được include bởi HTML. Nếu nó được include qua `<script async>`, hoặc được chèn động, thì đến lúc nó thực thi, `DOMContentLoaded` đã được kích hoạt. Để đảm bảo `doSomething()` luôn chạy khi tập lệnh tải, chúng ta cần có hai đường dẫn, một đường dẫn chạy ngay `doSomething` nếu tài liệu đã tải xong và đường dẫn kia chạy `doSomething` khi tài liệu đã tải.

> [!NOTE]
> Không có điều kiện race ở đây — tài liệu không thể được tải xong giữa bước kiểm tra `if` và lệnh gọi `addEventListener()`. JavaScript có ngữ nghĩa chạy cho đến khi hoàn tất, điều này có nghĩa là nếu tài liệu đang tải tại một nhịp cụ thể của event loop, nó không thể trở thành đã tải cho đến chu kỳ tiếp theo, tại thời điểm đó trình xử lý `doSomething` đã được đính kèm và sẽ được kích hoạt.

> [!NOTE]
> `document.readyState` được đặt thành `"interactive"` sau khi HTML parser hoàn tất nhưng trước khi thực thi các tập lệnh có `defer` hoặc `type="module"`. `DOMContentLoaded` được kích hoạt sau khi thực thi các tập lệnh này, nhưng trước khi thực thi các tập lệnh có `async`. `document.readyState` được đặt thành `"complete"` sau khi thực thi các tập lệnh async. Điều này có nghĩa là trong quá trình thực thi các tập lệnh defer và module, `document.readyState` là `"interactive"` nhưng vẫn có thể đính kèm trình lắng nghe `DOMContentLoaded` và làm cho chúng được kích hoạt như bình thường. Trong thực tế, việc thực thi `doSomething()` sớm hơn một chút là ổn trừ khi nó dựa vào một số trạng thái toàn cục được thiết lập bởi các tập lệnh defer/module khác.

### Ví dụ trực tiếp

#### HTML

```html
<div class="controls">
  <button id="reload" type="button">Tải lại</button>
</div>

<div class="event-log">
  <label for="eventLog">Nhật ký sự kiện:</label>
  <textarea
    readonly
    class="event-log-contents"
    rows="8"
    cols="30"
    id="eventLog"></textarea>
</div>
```

```css hidden
body {
  display: grid;
  grid-template-areas: "control log";
}

.controls {
  grid-area: control;
  display: flex;
  align-items: center;
  justify-content: center;
}

.event-log {
  grid-area: log;
}

.event-log-contents {
  resize: none;
}

label,
button {
  display: block;
}

#reload {
  height: 2rem;
}
```

#### JavaScript

```js
const log = document.querySelector(".event-log-contents");
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  log.textContent = "";
  setTimeout(() => {
    window.location.reload(true);
  }, 200);
});

window.addEventListener("load", (event) => {
  log.textContent += "load\n";
});

document.addEventListener("readystatechange", (event) => {
  log.textContent += `readystate: ${document.readyState}\n`;
});

document.addEventListener("DOMContentLoaded", (event) => {
  log.textContent += "DOMContentLoaded\n";
});
```

#### Kết quả

{{ EmbedLiveSample('Live_example', '100%', '160px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: {{domxref("Window/load_event", "load")}}, {{domxref("Document/readystatechange_event", "readystatechange")}}, {{domxref("Window/beforeunload_event", "beforeunload")}}, {{domxref("Window/unload_event", "unload")}}
