---
title: "Thử thách: Sắp xếp hoạt ảnh theo thứ tự"
short-title: "Thử thách: Chuỗi hoạt ảnh"
slug: Learn_web_development/Extensions/Async_JS/Sequencing_animations
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Async_JS/Introducing_workers", "Learn_web_development/Extensions/Async_JS")}}

Trong thử thách này, bạn sẽ cập nhật một trang để phát một loạt hoạt ảnh theo thứ tự. Để làm điều này, bạn sẽ sử dụng một số kỹ thuật chúng ta đã học trong bài viết [Cách sử dụng Promise](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết hợp lý về các kiến thức cơ bản về JavaScript,
        cách sử dụng các API dựa trên Promise.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Kiểm tra sự hiểu biết về cách sử dụng các API dựa trên Promise.</td>
    </tr>
  </tbody>
</table>

## Điểm xuất phát

Hãy tạo bản sao local của các tệp tại <https://github.com/mdn/learning-area/tree/main/javascript/asynchronous/sequencing-animations/start>. Nó chứa bốn tệp:

- alice.svg
- index.html
- main.js
- style.css

Tệp duy nhất bạn cần chỉnh sửa là "main.js".

Nếu bạn mở "index.html" trong trình duyệt, bạn sẽ thấy ba hình ảnh được sắp xếp theo đường chéo:

![Ảnh chụp màn hình trang thử thách sequencing-animations](./sequencing-animations.png)

Các hình ảnh được lấy từ hướng dẫn của chúng ta về [Sử dụng Web Animations API](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API).

> [!NOTE]
> Nếu bạn bị kẹt, bạn có thể liên hệ với chúng tôi trong một trong các [kênh truyền thông của chúng tôi](/en-US/docs/MDN/Community/Communication_channels).

## Tóm tắt dự án

Chúng ta muốn cập nhật trang này để áp dụng hoạt ảnh cho cả ba hình ảnh, từng cái một. Vì vậy khi cái đầu tiên hoàn thành, chúng ta tạo hoạt ảnh cho cái thứ hai, và khi cái thứ hai hoàn thành, chúng ta tạo hoạt ảnh cho cái thứ ba.

Hoạt ảnh đã được định nghĩa trong "main.js": nó chỉ xoay hình ảnh và thu nhỏ nó cho đến khi biến mất.

Để cho bạn biết thêm về cách chúng ta muốn trang hoạt động, [hãy xem ví dụ đã hoàn chỉnh](https://mdn.github.io/learning-area/javascript/asynchronous/sequencing-animations/finished/). Lưu ý rằng các hoạt ảnh chỉ chạy một lần: để xem chúng chạy lại, hãy tải lại trang.

## Các bước cần hoàn thành

### Tạo hoạt ảnh cho hình ảnh đầu tiên

Chúng ta đang sử dụng [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) để tạo hoạt ảnh cho các hình ảnh, cụ thể là phương thức {{domxref("Element/animate", "element.animate()")}}.

Cập nhật "main.js" để thêm lời gọi đến `alice1.animate()`, như sau:

```js
const aliceTumbling = [
  { transform: "rotate(0) scale(1)" },
  { transform: "rotate(360deg) scale(0)" },
];

const aliceTiming = {
  duration: 2000,
  iterations: 1,
  fill: "forwards",
};

const alice1 = document.querySelector("#alice1");
const alice2 = document.querySelector("#alice2");
const alice3 = document.querySelector("#alice3");

alice1.animate(aliceTumbling, aliceTiming);
```

Tải lại trang, và bạn sẽ thấy hình ảnh đầu tiên xoay và thu nhỏ.

### Tạo hoạt ảnh cho tất cả hình ảnh

Tiếp theo, chúng ta muốn tạo hoạt ảnh cho `alice2` khi `alice1` đã hoàn thành, và `alice3` khi `alice2` đã hoàn thành.

Phương thức `animate()` trả về đối tượng {{domxref("Animation")}}. Đối tượng này có thuộc tính `finished`, là một `Promise` được hoàn thành khi hoạt ảnh đã phát xong. Vì vậy chúng ta có thể sử dụng Promise này để biết khi nào bắt đầu hoạt ảnh tiếp theo.

Chúng tôi muốn bạn thử một vài cách khác nhau để triển khai điều này, để củng cố các cách khác nhau sử dụng Promise.

1. Đầu tiên, hãy triển khai điều gì đó hoạt động, nhưng có vấn đề phiên bản Promise của "callback hell" mà chúng ta đã thấy trong [thảo luận về việc sử dụng hàm gọi lại](/en-US/docs/Learn_web_development/Extensions/Async_JS/Introducing#callbacks).

2. Tiếp theo, hãy triển khai nó như một [chuỗi Promise](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises#chaining_promises). Lưu ý rằng có một vài cách khác nhau bạn có thể viết điều này, vì các hình thức khác nhau bạn có thể sử dụng cho [hàm mũi tên](/en-US/docs/Learn_web_development/Core/Scripting/Functions#arrow_functions). Hãy thử một số hình thức khác nhau. Cái nào ngắn gọn nhất? Cái nào bạn thấy dễ đọc nhất?

3. Cuối cùng, hãy triển khai nó bằng cách sử dụng [`async` và `await`](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises#async_and_await).

Nhớ rằng `element.animate()` _không_ trả về một `Promise`: nó trả về đối tượng `Animation` với thuộc tính `finished` là một `Promise`.

{{PreviousMenu("Learn_web_development/Extensions/Async_JS/Introducing_workers", "Learn_web_development/Extensions/Async_JS")}}
