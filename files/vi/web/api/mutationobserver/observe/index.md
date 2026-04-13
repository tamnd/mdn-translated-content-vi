---
title: "MutationObserver: phương thức observe()"
short-title: observe()
slug: Web/API/MutationObserver/observe
page-type: web-api-instance-method
browser-compat: api.MutationObserver.observe
---

{{APIRef("DOM WHATWG")}}

Phương thức {{domxref("MutationObserver")}} **`observe()`** cấu hình callback của `MutationObserver` để bắt đầu nhận thông báo về các thay đổi DOM khớp với các tùy chọn đã cho.

Tùy theo cấu hình, observer có thể theo dõi một {{domxref("Node")}} duy nhất trong cây DOM, hoặc nút đó cùng một số hoặc tất cả các nút hậu duệ của nó. Cùng một nút có thể được nhiều observer theo dõi, và cùng một `MutationObserver` có thể theo dõi các thay đổi ở những phần khác nhau của cây DOM và/hoặc các loại thay đổi khác nhau bằng cách gọi `observe()` nhiều lần trên cùng một `MutationObserver`.

Để dừng `MutationObserver` lại (sao cho không callback nào của nó còn được kích hoạt nữa), hãy gọi {{domxref("MutationObserver.disconnect()")}}.

## Cú pháp

```js-nolint
observe(target, options)
```

### Tham số

- `target`
  - : Một {{domxref("Node")}} DOM (có thể là {{domxref("Element")}}) trong cây DOM cần được theo dõi để phát hiện thay đổi, hoặc làm gốc của một cây con các nút cần theo dõi.
- `options`
  - : Một đối tượng cung cấp các tùy chọn mô tả những biến đổi DOM nào nên được báo cáo cho callback của `mutationObserver`. Tối thiểu, một trong `childList`, `attributes` và/hoặc `characterData` phải là `true` khi bạn gọi `observe()`. Nếu không, một ngoại lệ `TypeError` sẽ được ném ra.

    Các tùy chọn như sau:
    - `subtree` {{optional_inline}}
      - : Đặt thành `true` để mở rộng việc giám sát ra toàn bộ cây con được gốc bởi `target`. Khi đó, tất cả các thuộc tính khác cũng được áp dụng cho mọi nút trong cây con thay vì chỉ riêng nút `target`. Giá trị mặc định là `false`. Lưu ý rằng nếu một nút hậu duệ của `target` bị xóa, các thay đổi trong cây con đã tách đó vẫn sẽ tiếp tục được quan sát cho đến khi thông báo về chính việc xóa đó được gửi đi.
    - `childList` {{optional_inline}}
      - : Đặt thành `true` để giám sát nút đích (và, nếu `subtree` là `true`, các nút hậu duệ của nó) về việc thêm nút con mới hoặc xóa nút con hiện có. Giá trị mặc định là `false`.
    - `attributes` {{optional_inline}}
      - : Đặt thành `true` để theo dõi các thay đổi giá trị thuộc tính trên nút hoặc các nút đang được giám sát. Giá trị mặc định là `true` nếu `attributeFilter` hoặc `attributeOldValue` được chỉ định, ngược lại giá trị mặc định là `false`.
    - `attributeFilter` {{optional_inline}}
      - : Một mảng các tên thuộc tính cụ thể cần được giám sát. Nếu thuộc tính này không được bao gồm, các thay đổi trên mọi thuộc tính sẽ gây ra thông báo biến đổi.
    - `attributeOldValue` {{optional_inline}}
      - : Đặt thành `true` để ghi lại giá trị trước đó của bất kỳ thuộc tính nào thay đổi khi giám sát nút hoặc các nút về thay đổi thuộc tính; xem [Giám sát giá trị thuộc tính](#monitoring_attribute_values) để biết ví dụ theo dõi thay đổi thuộc tính và ghi lại giá trị. Giá trị mặc định là `false`.
    - `characterData` {{optional_inline}}
      - : Đặt thành `true` để giám sát nút đích đã chỉ định (và, nếu `subtree` là `true`, các nút hậu duệ của nó) về các thay đổi trong dữ liệu ký tự chứa bên trong nút hoặc các nút đó. Giá trị mặc định là `true` nếu `characterDataOldValue` được chỉ định, ngược lại giá trị mặc định là `false`.
    - `characterDataOldValue` {{optional_inline}}
      - : Đặt thành `true` để ghi lại giá trị trước đó của văn bản trong một nút mỗi khi văn bản thay đổi trên các nút đang được giám sát. Giá trị mặc định là `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref('TypeError')}}
  - : Được ném ra trong bất kỳ trường hợp nào sau đây:
    - Các `options` được cấu hình sao cho không có gì thực sự được giám sát. (Ví dụ, nếu `childList`, `attributes`, và `characterData` đều là `false`.)
    - Giá trị của `options.attributes` là `false` (nghĩa là các thay đổi thuộc tính không được giám sát), nhưng `attributeOldValue` là `true` và/hoặc `attributeFilter` có mặt.
    - Tùy chọn `characterDataOldValue` là `true` nhưng `characterData` là `false` (nghĩa là các thay đổi ký tự không được giám sát).

## Ví dụ

### Cách dùng cơ bản

Trong ví dụ này, chúng ta minh họa cách gọi phương thức **`observe()`** trên một thể hiện {{domxref("MutationObserver")}}, sau khi nó đã được thiết lập, bằng cách truyền vào một phần tử đích và một đối tượng `options`.

```js
// tạo một thể hiện mới của `MutationObserver` tên là `observer`,
// truyền vào nó một hàm callback
const observer = new MutationObserver(() => {
  console.log("callback chạy khi observer được kích hoạt");
});

// gọi `observe()`, truyền vào phần tử cần theo dõi và đối tượng tùy chọn
observer.observe(document.querySelector("#element-to-observe"), {
  subtree: true,
  childList: true,
});
```

### Các hậu duệ bị xóa khi dùng `subtree`

Nếu bạn theo dõi một nút bằng tùy chọn `subtree`, bạn sẽ tiếp tục nhận được thông báo về các thay đổi của các nút hậu duệ của nút đó, ngay cả sau khi một phần của cây con bị xóa. Tuy nhiên, sau khi thông báo về việc xóa đó được gửi đi, các thay đổi tiếp theo trong cây con đã tách sẽ không còn kích hoạt observer nữa.

Điều này giúp bạn không bỏ lỡ các thay đổi xảy ra sau khi kết nối bị cắt đứt và trước khi bạn có cơ hội bắt đầu giám sát riêng nút hoặc cây con đã được di chuyển. Về mặt lý thuyết, điều này có nghĩa là nếu bạn theo dõi các đối tượng {{domxref("MutationRecord")}} mô tả các thay đổi xảy ra, bạn sẽ có thể "hoàn tác" các thay đổi đó, đưa DOM trở về trạng thái ban đầu.

```html
<div id="target">
  <div id="child"></div>
</div>
```

```js
const target = document.getElementById("target");
const child = document.getElementById("child");

const observer = new MutationObserver((mutations) => {
  mutations.forEach((mutation) => {
    console.log(mutation.type, mutation.target.id, mutation.attributeName);

    if (mutation.type === "childList" && mutation.target.id === "target") {
      // Sau khi nhận được thông báo rằng child đã bị xóa,
      // các sửa đổi tiếp theo trong cây con đã tách sẽ không còn kích hoạt observer nữa.
      child.setAttribute("data-bar", "");
    }
  });
});

observer.observe(target, {
  attributes: true,
  childList: true,
  subtree: true,
});

target.removeChild(child);
// Thay đổi này xảy ra trước khi thông báo "childList target" được gửi đi,
// nên nó cũng sẽ kích hoạt observer.
child.setAttribute("data-foo", "");

// Output:
// childList target null
// attributes child data-foo
// Không có thông báo "attributes child data-bar".
```

### Dùng `attributeFilter`

Trong ví dụ này, một Mutation Observer được thiết lập để theo dõi các thay đổi trên các thuộc tính `status` và `username` trong bất kỳ phần tử nào nằm trong một cây con hiển thị tên người dùng trong phòng chat. Điều này cho phép mã, chẳng hạn, phản ánh thay đổi biệt danh của người dùng, hoặc đánh dấu họ là away from keyboard (AFK) hoặc offline.

```js
function callback(mutationList) {
  mutationList.forEach((mutation) => {
    switch (mutation.type) {
      case "attributes":
        switch (mutation.attributeName) {
          case "status":
            userStatusChanged(mutation.target.username, mutation.target.status);
            break;
          case "username":
            usernameChanged(mutation.oldValue, mutation.target.username);
            break;
        }
        break;
    }
  });
}

const userListElement = document.querySelector("#user-list");

const observer = new MutationObserver(callback);
observer.observe(userListElement, {
  attributeFilter: ["status", "username"],
  attributeOldValue: true,
  subtree: true,
});
```

### Giám sát giá trị thuộc tính

Trong ví dụ này, chúng ta quan sát một phần tử để phát hiện thay đổi giá trị thuộc tính, và thêm một nút để chuyển đổi thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) của phần tử giữa `"ltr"` và `"rtl"`. Bên trong callback của observer, chúng ta ghi lại giá trị cũ của thuộc tính.

#### HTML

```html
<button id="toggle">Toggle direction</button><br />
<div id="container">
  <input type="text" id="rhubarb" dir="ltr" value="Tofu" />
</div>
<pre id="output"></pre>
```

#### CSS

```css
body {
  background-color: paleturquoise;
}

button,
input,
pre {
  margin: 0.5rem;
}
```

#### JavaScript

```js
const toggle = document.querySelector("#toggle");
const rhubarb = document.querySelector("#rhubarb");
const observerTarget = document.querySelector("#container");
const output = document.querySelector("#output");

toggle.addEventListener("click", () => {
  rhubarb.dir = rhubarb.dir === "ltr" ? "rtl" : "ltr";
});

const config = {
  subtree: true,
  attributeOldValue: true,
};

const callback = (mutationList) => {
  for (const mutation of mutationList) {
    if (mutation.type === "attributes") {
      output.textContent = `Thuộc tính ${mutation.attributeName} đã được sửa đổi từ "${mutation.oldValue}".`;
    }
  }
};

const observer = new MutationObserver(callback);
observer.observe(observerTarget, config);
```

#### Kết quả

{{EmbedLiveSample("Monitoring attribute values")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
