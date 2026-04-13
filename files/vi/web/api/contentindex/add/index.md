---
title: "ContentIndex: phương thức add()"
short-title: add()
slug: Web/API/ContentIndex/add
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ContentIndex.add
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`add()`** của giao diện {{domxref("ContentIndex")}} đăng ký một mục với [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API).

## Cú pháp

```js-nolint
add(contentDescription)
```

### Tham số

- `contentDescription`
  - : Một {{jsxref('Object')}} chứa dữ liệu sau:
    - `id`
      - : Một mã định danh {{jsxref('String')}} duy nhất.
    - `title`
      - : Một tiêu đề {{jsxref('String')}} cho mục.
        Được dùng trong các danh sách nội dung hiển thị cho người dùng.
    - `description`
      - : Một mô tả {{jsxref('String')}} cho mục.
        Được dùng trong các danh sách nội dung hiển thị cho người dùng.
    - `url`
      - : Một {{jsxref('String')}} chứa URL của tài liệu HTML tương ứng.
        URL này phải nằm trong phạm vi của [service worker](/en-US/docs/Web/API/ServiceWorker) hiện tại.
    - `category` {{Optional_Inline}}
      - : Một {{jsxref('String')}} xác định danh mục của nội dung.
        Có thể là:
        - `''` Một {{jsxref('String')}} rỗng, đây là giá trị mặc định.
        - `homepage`
        - `article`
        - `video`
        - `audio`

    - `icons` {{Optional_Inline}}
      - : Một {{jsxref('Array')}} các tài nguyên ảnh, được xác định dưới dạng một {{jsxref('Object')}} với dữ liệu sau:
        - `src`
          - : Một URL {{jsxref('String')}} của ảnh nguồn.
        - `sizes` {{Optional_Inline}}
          - : Một {{jsxref('String')}} biểu diễn kích thước ảnh.
        - `type` {{Optional_Inline}}
          - : {{Glossary("MIME type")}} của ảnh.
        - `label` {{Optional_Inline}}
          - : Một chuỗi biểu diễn tên có thể truy cập của biểu tượng.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ngoại lệ này được ném ra trong các điều kiện sau:
    - Service worker registration không tồn tại hoặc service worker không chứa {{domxref('FetchEvent')}}.
    - Một trong các tham số `id`, `title`, `description` hoặc `url` bị thiếu, không phải kiểu {{jsxref('String')}}, hoặc là một {{jsxref('String')}} rỗng.
    - Tham số `url` không cùng {{glossary("same-origin policy")}} với {{domxref("ServiceWorker", "service worker", "", "nocode")}}.
    - Một trong các mục trong `icons` không phải kiểu ảnh, hoặc việc truy xuất một trong các mục trong `icons` thất bại do lỗi mạng hoặc lỗi giải mã.

## Ví dụ

Ở đây, chúng ta khai báo một mục theo đúng định dạng và tạo một hàm bất đồng bộ dùng phương thức `add` để đăng ký mục đó với [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API).

```js
// nội dung của chúng ta
const item = {
  id: "post-1",
  url: "/posts/amet.html",
  title: "Amet consectetur adipisicing",
  description:
    "Repellat et quia iste possimus ducimus aliquid a aut eaque nostrum.",
  icons: [
    {
      src: "/media/dark.png",
      sizes: "128x128",
      type: "image/png",
    },
  ],
  category: "article",
};

// hàm bất đồng bộ để thêm nội dung được lập chỉ mục
async function registerContent(data) {
  const registration = await navigator.serviceWorker.ready;

  // phát hiện Content Index
  if (!registration.index) {
    return;
  }

  // đăng ký nội dung
  try {
    await registration.index.add(data);
  } catch (e) {
    console.log("Failed to register content: ", e.message);
  }
}
```

Phương thức `add` cũng có thể được dùng trong phạm vi [service worker](/en-US/docs/Web/API/ServiceWorker).

```js
// nội dung của chúng ta
const item = {
  id: "post-1",
  url: "/posts/amet.html",
  title: "Amet consectetur adipisicing",
  description:
    "Repellat et quia iste possimus ducimus aliquid a aut eaque nostrum.",
  icons: [
    {
      src: "/media/dark.png",
      sizes: "128x128",
      type: "image/png",
    },
  ],
  category: "article",
};

self.registration.index.add(item);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết nhập môn về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
