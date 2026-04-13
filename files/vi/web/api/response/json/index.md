---
title: "Response: phương thức json()"
short-title: json()
slug: Web/API/Response/json
page-type: web-api-instance-method
browser-compat: api.Response.json
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`json()`** của giao diện {{DOMxRef("Response")}} nhận một luồng {{DOMxRef("Response")}} và đọc nó đến hết. Phương thức này trả về một promise giải quyết với kết quả phân tích văn bản thân phản hồi dưới dạng {{JSxRef("JSON")}}.

Lưu ý rằng dù phương thức có tên `json()`, kết quả không phải JSON mà là kết quả của việc lấy JSON làm đầu vào và phân tích nó để tạo ra một object JavaScript.

## Cú pháp

```js-nolint
json()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một object JavaScript. Object này có thể là bất kỳ thứ gì có thể được biểu diễn bằng JSON, như object, array, string, number.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Ném ra vì một trong các lý do sau:
    - Body phản hồi bị [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
- {{jsxref("SyntaxError")}}
  - : Body phản hồi không thể được phân tích thành JSON.

## Ví dụ

Trong ví dụ [fetch JSON](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-json) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-json/)), chúng ta tạo một yêu cầu mới bằng constructor {{DOMxRef("Request.Request", "Request()")}}, rồi dùng nó để fetch một file `.json`.
Khi fetch thành công, chúng ta đọc và phân tích dữ liệu bằng `json()`, rồi lấy các giá trị từ object kết quả như mong đợi và chèn chúng vào các mục danh sách để hiển thị dữ liệu sản phẩm.

```js
const myList = document.querySelector("ul");
const myRequest = new Request("products.json");

fetch(myRequest)
  .then((response) => response.json())
  .then((data) => {
    for (const product of data.products) {
      const listItem = document.createElement("li");
      listItem.appendChild(document.createElement("strong")).textContent =
        product.Name;
      listItem.append(` can be found in ${product.Location}. Cost: `);
      listItem.appendChild(document.createElement("strong")).textContent =
        `£${product.Price}`;
      myList.appendChild(listItem);
    }
  })
  .catch(console.error);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
