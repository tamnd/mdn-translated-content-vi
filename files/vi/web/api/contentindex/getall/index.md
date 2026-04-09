---
title: "ContentIndex: phương thức getAll()"
short-title: getAll()
slug: Web/API/ContentIndex/getAll
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ContentIndex.getAll
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`getAll()`** của giao diện {{domxref("ContentIndex")}} trả về một {{jsxref('Promise')}} được giải quyết với một danh sách có thể lặp các mục trong chỉ mục nội dung.

## Cú pháp

```js-nolint
getAll()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết với một {{jsxref('Array')}} các mục `contentDescription`.

- `contentDescription`
  - : Mỗi mục được trả về là một {{jsxref('Object')}} chứa dữ liệu sau:
    - `id`
      - : Một mã định danh {{jsxref('String')}} duy nhất.
    - `title`
      - : Một tiêu đề {{jsxref('String')}} của mục.
        Được dùng trong các danh sách nội dung hiển thị cho người dùng.
    - `description`
      - : Một mô tả {{jsxref('String')}} của mục.
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

### Ngoại lệ

Không có ngoại lệ nào được ném ra. Nếu không có mục nào trong Content Index, một {{jsxref('Array')}} rỗng sẽ được trả về.

## Ví dụ

Ví dụ bên dưới cho thấy một hàm bất đồng bộ lấy các mục trong [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API) rồi lặp qua từng mục để xây dựng một danh sách cho giao diện.

```js
async function createReadingList() {
  // truy cập service worker registration
  const registration = await navigator.serviceWorker.ready;

  // lấy các mục trong chỉ mục
  const entries = await registration.index.getAll();

  // tạo phần tử chứa
  const readingListElem = document.createElement("div");

  // kiểm tra xem có mục nào không
  if (entries.length === 0) {
    // nếu không có mục nào, hiển thị thông báo
    const message = document.createElement("p");
    message.innerText =
      "You currently have no articles saved for offline reading.";

    readingListElem.append(message);
  } else {
    // nếu có mục, hiển thị chúng dưới dạng danh sách liên kết tới nội dung
    const listElem = document.createElement("ul");

    for (const entry of entries) {
      const listItem = document.createElement("li");

      const anchorElem = document.createElement("a");
      anchorElem.innerText = entry.title;
      anchorElem.setAttribute("href", entry.url);

      listElem.append(listItem);
    }

    readingListElem.append(listElem);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết nhập môn về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
