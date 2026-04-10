---
title: Dùng Web Storage API
slug: Web/API/Web_Storage_API/Using_the_Web_Storage_API
page-type: guide
browser-compat:
  - api.Window.localStorage
  - api.Window.sessionStorage
---

{{DefaultAPISidebar("Web Storage API")}}

Web Storage API cung cấp các cơ chế cho phép trình duyệt lưu trữ an toàn các cặp khóa/giá trị.

Bài viết này trình bày cách sử dụng công nghệ này.

## Các khái niệm cơ bản

Đối tượng lưu trữ là các kho khóa-giá trị đơn giản, tương tự như object, nhưng chúng vẫn tồn tại qua các lần tải lại trang. Khóa và giá trị luôn là chuỗi, lưu ý rằng, giống như object, các khóa số nguyên sẽ tự động được chuyển thành chuỗi. Bạn có thể truy cập các giá trị này như một object, hoặc dùng các phương thức {{domxref("Storage.getItem()")}} và {{domxref("Storage.setItem()")}}. Ba dòng dưới đây đều đặt cùng một mục `colorSetting`:

```js
localStorage.colorSetting = "#a4509b";
localStorage["colorSetting"] = "#a4509b";
localStorage.setItem("colorSetting", "#a4509b");
```

> [!NOTE]
> Bạn nên dùng Web Storage API (`setItem`, `getItem`, `removeItem`, `key`, `length`) để tránh các [cạm bẫy](https://2ality.com/2012/01/objects-as-maps.html) khi dùng object thường làm kho khóa-giá trị.

Hai cơ chế trong Web Storage gồm:

- `sessionStorage` duy trì một vùng lưu trữ riêng cho mỗi origin trong suốt thời gian của phiên trang, miễn là trình duyệt còn mở, bao gồm cả tải lại và khôi phục trang.
- `localStorage` cũng hoạt động tương tự, nhưng dữ liệu vẫn tồn tại ngay cả khi trình duyệt bị đóng và mở lại.

Các cơ chế này có sẵn thông qua các thuộc tính {{domxref("Window.sessionStorage")}} và {{domxref("Window.localStorage")}}. Nói chính xác hơn, trong các trình duyệt hỗ trợ, đối tượng `Window` triển khai các đối tượng `WindowLocalStorage` và `WindowSessionStorage`, mà `localStorage` và `sessionStorage` là các thuộc tính thành viên của chúng. Gọi một trong hai thuộc tính này sẽ tạo ra một thể hiện của đối tượng {{domxref("Storage")}}, thông qua đó các mục dữ liệu có thể được đặt, lấy và xóa. Một đối tượng `Storage` khác nhau được dùng cho `sessionStorage` và `localStorage` của từng origin, và chúng hoạt động hoàn toàn riêng biệt.

Ví dụ, lần đầu tiên gọi `localStorage` trên một tài liệu sẽ trả về một đối tượng {{domxref("Storage")}}. Gọi `sessionStorage` trên cùng tài liệu sẽ trả về một đối tượng {{domxref("Storage")}} khác. Cả hai có thể được thao tác theo cùng một cách, nhưng độc lập với nhau.

## Phát hiện tính năng localStorage

Để có thể dùng `localStorage`, trước tiên chúng ta nên xác minh rằng nó được hỗ trợ và khả dụng trong phiên duyệt hiện tại.

### Kiểm tra tính khả dụng

Các trình duyệt hỗ trợ `localStorage` có một thuộc tính trên đối tượng `window` tên là `localStorage`. Tuy nhiên, chỉ kiểm tra xem thuộc tính đó có tồn tại hay không, như trong phát hiện tính năng thông thường, có thể là chưa đủ. Nhiều trình duyệt cung cấp tùy chọn vô hiệu hóa API lưu trữ mà không ẩn đối tượng toàn cục. Vì vậy, trình duyệt có thể _hỗ trợ_ `localStorage`, nhưng không làm cho nó _khả dụng_ với script trên trang.

Ví dụ, với một tài liệu được xem trong chế độ duyệt riêng tư của trình duyệt, một số trình duyệt có thể cung cấp một đối tượng `localStorage` rỗng với hạn mức bằng không, khiến nó thực tế không thể dùng được. Ngược lại, chúng ta có thể nhận được lỗi `QuotaExceededError` hợp lệ, nghĩa là chúng ta đã dùng hết không gian lưu trữ có sẵn, nhưng lưu trữ _thực sự_ vẫn _khả dụng_. Việc phát hiện tính năng nên tính đến các trường hợp này.

Đây là một hàm dùng để phát hiện liệu `localStorage` có vừa được hỗ trợ vừa khả dụng hay không:

```js
function storageAvailable(type) {
  let storage;
  try {
    storage = window[type];
    const x = "__storage_test__";
    storage.setItem(x, x);
    storage.removeItem(x);
    return true;
  } catch (e) {
    return (
      e instanceof DOMException &&
      e.name === "QuotaExceededError" &&
      // chỉ chấp nhận QuotaExceededError nếu đã có gì đó được lưu
      storage &&
      storage.length !== 0
    );
  }
}
```

Và đây là cách sử dụng nó:

```js
if (storageAvailable("localStorage")) {
  // Tuyệt! Chúng ta có thể dùng localStorage
} else {
  // Tiếc thật, localStorage không khả dụng
}
```

Bạn cũng có thể kiểm tra `sessionStorage` bằng cách gọi `storageAvailable("sessionStorage")`.

## Ví dụ

Để minh họa một số cách dùng điển hình của web storage, chúng tôi đã tạo một ví dụ có tên **Web Storage Demo**. [Trang đích](https://mdn.github.io/dom-examples/web-storage/) cung cấp các điều khiển để tùy chỉnh màu sắc, phông chữ và ảnh trang trí:

![Ví dụ web storage với hộp văn bản để chọn màu bằng cách nhập giá trị hex, cùng hai menu thả xuống để chọn kiểu phông chữ và ảnh trang trí.](landing.png)

Khi bạn chọn các tùy chọn khác nhau, trang sẽ được cập nhật ngay lập tức. Ngoài ra, các lựa chọn của bạn cũng được lưu trong `localStorage`, để khi bạn rời khỏi trang rồi tải lại sau đó, các lựa chọn vẫn được ghi nhớ.

Chúng tôi cũng cung cấp một [trang xuất sự kiện](https://mdn.github.io/dom-examples/web-storage/event.html). Nếu bạn tải trang này ở một tab khác rồi thay đổi các lựa chọn của mình trong trang đích, bạn sẽ thấy thông tin lưu trữ được cập nhật khi một {{domxref("StorageEvent")}} được kích hoạt.

![Trang xuất sự kiện](event-output.png)

> [!NOTE]
> Ngoài việc xem trực tiếp các trang ví dụ bằng các liên kết ở trên, bạn cũng có thể [xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/web-storage).

### Kiểm tra xem vùng lưu trữ của bạn đã được điền dữ liệu hay chưa

Trước tiên, trong [main.js](https://github.com/mdn/dom-examples/blob/main/web-storage/main.js), chúng ta kiểm tra xem đối tượng lưu trữ đã được điền dữ liệu hay chưa, nghĩa là trang đã từng được truy cập trước đó:

```js
if (!localStorage.getItem("bgcolor")) {
  populateStorage();
} else {
  setStyles();
}
```

Phương thức {{domxref("Storage.getItem()")}} được dùng để lấy một mục dữ liệu từ storage. Trong trường hợp này, chúng ta đang kiểm tra xem mục `bgcolor` có tồn tại hay không. Nếu không, chúng ta chạy `populateStorage()` để thêm các giá trị tùy chỉnh hiện tại vào storage. Nếu đã có giá trị, chúng ta chạy `setStyles()` để cập nhật kiểu dáng của trang bằng các giá trị đã lưu.

> [!NOTE]
> Bạn cũng có thể dùng {{domxref("Storage.length")}} để kiểm tra xem đối tượng storage có trống hay không.

### Lấy giá trị từ storage

Như đã lưu ý ở trên, giá trị có thể được lấy từ storage bằng {{domxref("Storage.getItem()")}}.
Phương thức này nhận khóa của mục dữ liệu làm đối số và trả về giá trị dữ liệu.

Ví dụ:

```js
function setStyles() {
  const currentColor = localStorage.getItem("bgcolor");
  const currentFont = localStorage.getItem("font");
  const currentImage = localStorage.getItem("image");

  document.getElementById("bgcolor").value = currentColor;
  document.getElementById("font").value = currentFont;
  document.getElementById("image").value = currentImage;

  htmlElem.style.backgroundColor = `#${currentColor}`;
  pElem.style.fontFamily = currentFont;
  imgElem.setAttribute("src", currentImage);
}
```

Ở đây, ba dòng đầu tiên lấy các giá trị từ local storage.
Tiếp theo, chúng ta đặt các giá trị được hiển thị trong các phần tử biểu mẫu bằng các giá trị đó để chúng luôn đồng bộ khi bạn tải lại trang.
Cuối cùng, chúng ta cập nhật kiểu dáng và ảnh trang trí trên trang để các tùy chọn tùy chỉnh của bạn lại xuất hiện khi tải lại.

### Đặt giá trị trong storage

{{domxref("Storage.setItem()")}} được dùng cả để tạo mục dữ liệu mới và, nếu mục dữ liệu đã tồn tại, cập nhật giá trị hiện có. Phương thức này nhận hai đối số: khóa của mục dữ liệu cần tạo hoặc sửa đổi, và giá trị cần lưu vào đó.

```js
function populateStorage() {
  localStorage.setItem("bgcolor", document.getElementById("bgcolor").value);
  localStorage.setItem("font", document.getElementById("font").value);
  localStorage.setItem("image", document.getElementById("image").value);

  setStyles();
}
```

Hàm `populateStorage()` đặt ba mục trong local storage: màu nền, phông chữ và đường dẫn ảnh. Sau đó nó chạy hàm `setStyles()` để cập nhật kiểu dáng của trang, v.v.

Chúng tôi cũng thêm trình xử lý `onchange` trên mỗi phần tử biểu mẫu để dữ liệu và kiểu dáng được cập nhật bất cứ khi nào giá trị biểu mẫu thay đổi:

```js
bgcolorForm.onchange = populateStorage;
fontForm.onchange = populateStorage;
imageForm.onchange = populateStorage;
```

`Storage` chỉ hỗ trợ lưu và truy xuất chuỗi. Nếu bạn muốn lưu các kiểu dữ liệu khác, bạn phải chuyển chúng thành chuỗi. Với object thuần và mảng, bạn có thể dùng {{jsxref("JSON.stringify()")}}.

```js
const person = { name: "Alex" };
localStorage.setItem("user", person);
console.log(localStorage.getItem("user")); // "[object Object]"; không hữu ích!
localStorage.setItem("user", JSON.stringify(person));
console.log(JSON.parse(localStorage.getItem("user"))); // { name: "Alex" }
```

Tuy nhiên, không có cách tổng quát nào để lưu mọi kiểu dữ liệu tùy ý. Hơn nữa, đối tượng được truy xuất là một [bản sao sâu](/en-US/docs/Glossary/Deep_copy) của đối tượng gốc và các thay đổi trên nó không ảnh hưởng đến đối tượng gốc.

### Phản hồi với thay đổi storage bằng StorageEvent

Sự kiện {{domxref("Window/storage_event", "storage")}} được kích hoạt bất cứ khi nào một thay đổi được thực hiện đối với đối tượng {{domxref("Storage")}} của một tài liệu khác chia sẻ cùng không gian lưu trữ. Điều này sẽ không hoạt động trên cùng trang đang thực hiện thay đổi, mà thực sự là cách để các trang khác trên cùng origin sử dụng storage có thể đồng bộ bất kỳ thay đổi nào được thực hiện. Các trang trên origin khác không thể truy cập cùng các đối tượng storage.

Đối với `localStorage`, không gian lưu trữ được chia sẻ giữa tất cả các tab có cùng origin. Với `sessionStorage`, không gian lưu trữ chỉ được chia sẻ trong cùng tab, giữa tất cả các iframe có cùng origin.

Trên trang sự kiện, xem [events.js](https://github.com/mdn/dom-examples/blob/main/web-storage/event.js), đoạn JavaScript duy nhất là:

```js
window.addEventListener("storage", (e) => {
  document.querySelector(".my-key").textContent = e.key;
  document.querySelector(".my-old").textContent = e.oldValue;
  document.querySelector(".my-new").textContent = e.newValue;
  document.querySelector(".my-url").textContent = e.url;
  document.querySelector(".my-storage").textContent = JSON.stringify(
    e.storageArea,
  );
});
```

Ở đây chúng ta thêm một trình nghe sự kiện vào đối tượng `window`, được kích hoạt khi đối tượng {{domxref("Storage")}} liên kết với origin hiện tại thay đổi. Như bạn có thể thấy ở trên, đối tượng sự kiện liên quan đến sự kiện này có một số thuộc tính chứa thông tin hữu ích: khóa của dữ liệu đã thay đổi, giá trị cũ trước thay đổi, giá trị mới sau thay đổi, URL của tài liệu đã thay đổi storage và bản thân đối tượng storage, chúng tôi đã chuyển thành chuỗi để bạn có thể xem nội dung của nó.

### Xóa bản ghi dữ liệu

Web Storage cũng cung cấp một vài phương thức đơn giản để xóa dữ liệu. Chúng tôi không dùng chúng trong bản demo, nhưng rất dễ thêm vào dự án của bạn:

- {{domxref("Storage.removeItem()")}} nhận một đối số duy nhất là khóa của mục dữ liệu bạn muốn xóa và loại bỏ nó khỏi đối tượng storage của origin đó.
- {{domxref("Storage.clear()")}} không nhận đối số nào và làm trống toàn bộ đối tượng storage của origin đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Trang đích của Web Storage API](/en-US/docs/Web/API/Web_Storage_API)
