---
title: Storage API
slug: Web/API/Storage_API
page-type: web-api-overview
browser-compat: api.StorageManager
---

{{securecontext_header}}{{DefaultAPISidebar("Storage")}} {{AvailableInWorkers}}

[Storage Standard](https://storage.spec.whatwg.org/) định nghĩa một hệ thống lưu trữ chia sẻ được thiết kế để sử dụng bởi tất cả các API và công nghệ mà trang web có thể dùng để lưu trữ dữ liệu trong trình duyệt của người dùng.

Dữ liệu được lưu trữ cho một trang web được quản lý bởi Storage Standard thường bao gồm [cơ sở dữ liệu IndexedDB](/en-US/docs/Web/API/IndexedDB_API) và [dữ liệu Cache API](/en-US/docs/Web/API/Cache), nhưng có thể bao gồm các loại dữ liệu khác có thể truy cập bởi trang như [dữ liệu Web Storage API](/en-US/docs/Web/API/Web_Storage_API).

Storage API cho phép các trang web tìm hiểu có bao nhiêu không gian họ có thể sử dụng, đang sử dụng bao nhiêu, và thậm chí kiểm soát liệu họ có cần được thông báo trước khi {{Glossary("user agent")}} xóa dữ liệu để nhường chỗ cho các thứ khác hay không.

Bài viết này cung cấp tổng quan về cách user agents lưu trữ và duy trì dữ liệu của các trang web. Để biết thêm thông tin về giới hạn lưu trữ và thu hồi, xem [Browser storage quotas and eviction criteria](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).

## Khái niệm và cách sử dụng

### Các bucket lưu trữ

Hệ thống lưu trữ được mô tả bởi Storage Standard, nơi dữ liệu trang được lưu trữ, thường bao gồm một _bucket_ duy nhất cho mỗi {{Glossary("origin")}}.

Về cơ bản, mỗi trang web có không gian lưu trữ riêng để đặt dữ liệu. Tuy nhiên, trong một số trường hợp, user agents có thể quyết định lưu trữ dữ liệu của một origin trong nhiều bucket khác nhau, ví dụ khi origin này được nhúng trong các origin bên thứ ba khác nhau.

### Chế độ bucket

Mỗi bucket lưu trữ của trang có một _chế độ_ mô tả chính sách giữ dữ liệu cho bucket đó. Có hai chế độ:

- `"best-effort"`
  - : User agent sẽ cố gắng giữ lại dữ liệu trong bucket càng lâu càng tốt, _nhưng sẽ không cảnh báo người dùng_ nếu dung lượng lưu trữ thấp và cần xóa bucket để giảm áp lực lưu trữ.
- `"persistent"`
  - : User agent sẽ giữ lại dữ liệu càng lâu càng có thể, xóa tất cả các bucket `"best-effort"` trước khi xem xét xóa bucket được đánh dấu `"persistent"`. Nếu cần xóa các bucket persistent, user agent sẽ thông báo cho người dùng và cung cấp cách xóa một hoặc nhiều bucket persistent khi cần.

Bạn có thể thay đổi chế độ bucket lưu trữ của một origin bằng cách dùng phương thức {{domxref("StorageManager.persist", "navigator.storage.persist()")}}, yêu cầu [quyền người dùng](/en-US/docs/Web/API/Permissions_API) `"persistent-storage"`.

```js
if (navigator.storage && navigator.storage.persist) {
  navigator.storage.persist().then((persistent) => {
    if (persistent) {
      console.log("Storage will not be cleared except by explicit user action");
    } else {
      console.log("Storage may be cleared by the UA under storage pressure.");
    }
  });
}
```

Bạn cũng có thể dùng phương thức {{domxref("StorageManager.persisted", "navigator.storage.persisted()")}} để biết liệu lưu trữ của một origin có persistent hay không:

```js
if (navigator.storage && navigator.storage.persist) {
  navigator.storage.persisted().then((persistent) => {
    if (persistent) {
      console.log("Storage will not be cleared except by explicit user action");
    } else {
      console.log("Storage may be cleared by the UA under storage pressure.");
    }
  });
}
```

### Ước tính quota và usage

User agent xác định, bằng bất kỳ cơ chế nào nó chọn, lượng lưu trữ tối đa mà một trang nhất định có thể dùng. Giá trị tối đa này là **quota** của origin. Lượng không gian này đang được trang sử dụng được gọi là **usage**. Cả hai giá trị đều là ước tính.

Để xác định các giá trị quota và usage ước tính cho một origin nhất định, dùng phương thức {{domxref("StorageManager.estimate", "navigator.storage.estimate()")}}, trả về một promise khi được giải quyết sẽ nhận một đối tượng chứa các con số này. Ví dụ:

```js
navigator.storage.estimate().then((estimate) => {
  // estimate.quota là quota ước tính
  // estimate.usage là số byte đã dùng ước tính
});
```

## Giao diện

- {{domxref("StorageManager")}}
  - : Cung cấp giao diện để quản lý quyền persistent và ước tính dung lượng lưu trữ khả dụng.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.storage")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("StorageManager")}} singleton được dùng để quản lý quyền persistent và ước tính dung lượng lưu trữ khả dụng trên từng trang/ứng dụng.
- {{domxref("WorkerNavigator.storage")}} {{ReadOnlyInline}}
  - : Trả về giao diện {{domxref("StorageManager")}} để quản lý quyền persistent và ước tính dung lượng lưu trữ khả dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Permissions API](/en-US/docs/Web/API/Permissions_API/Using_the_Permissions_API)
- [Storage for the web on web.dev](https://web.dev/articles/storage-for-the-web)
- [Persistent storage on web.dev](https://web.dev/articles/persistent-storage)
- [Chrome Web Storage and Quota Concepts](https://docs.google.com/document/d/19QemRTdIxYaJ4gkHYf2WWBNPbpuZQDNMpUVf8dQxj4U/edit)
