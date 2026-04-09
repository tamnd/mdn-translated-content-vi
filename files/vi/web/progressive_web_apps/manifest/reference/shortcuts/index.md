---
title: shortcuts
slug: Web/Progressive_web_apps/Manifest/Reference/shortcuts
page-type: web-manifest-member
browser-compat: manifests.webapp.shortcuts
sidebar: pwasidebar
---

Member manifest `shortcuts` được dùng để chỉ định các liên kết tới những tác vụ hoặc trang quan trọng bên trong ứng dụng web của bạn.
Trình duyệt có thể dùng thông tin này để tạo một menu ngữ cảnh, thường được hiển thị khi người dùng tương tác với biểu tượng ứng dụng web.

## Cú pháp

```json-nolint
/* Một shortcut với tất cả thuộc tính */
"shortcuts": [
  {
    "name": "Lịch trình hôm nay",
    "short_name": "Agenda",
    "description": "Xem lịch trình của bạn cho hôm nay",
    "url": "/today",
    "icons": [
      {
        "src": "today.png",
        "sizes": "192x192"
        }
    ]
  }
]

/* Hai shortcut với các thuộc tính bắt buộc */
"shortcuts": [
  {
    "name": "Lịch trình hôm nay",
    "url": "/today"
  },
  {
    "name": "Lịch trình ngày mai",
    "url": "/tomorrow"
  }
]

/* Shortcut với URL tương đối */
"shortcuts": [
  {
    "name": "Lịch trình tuần này",
    "url": "../agenda"
  }
]
```

### Giá trị

- `shortcuts`
  - : Một mảng các đối tượng. Mỗi đối tượng đại diện cho một tác vụ hoặc trang quan trọng trong ứng dụng web.

    Mỗi đối tượng có thể có một hoặc nhiều thuộc tính. Trong số đó, chỉ `name` và `url` là bắt buộc.
    Các thuộc tính có thể có gồm:
    - `name`
      - : Một chuỗi đại diện cho tên của shortcut, được hiển thị cho người dùng trong menu ngữ cảnh.

    - `short_name` {{Optional_Inline}}
      - : Một chuỗi đại diện cho phiên bản ngắn của tên shortcut.
        Trình duyệt có thể dùng giá trị này trong các ngữ cảnh không đủ chỗ để hiển thị tên đầy đủ.

    - `description` {{Optional_Inline}}
      - : Một chuỗi mô tả mục đích của shortcut.
        Trình duyệt có thể hiển thị thông tin này cho công nghệ hỗ trợ, chẳng hạn trình đọc màn hình, điều này có thể giúp người dùng hiểu mục đích của shortcut.

    - `url`
      - : Một URL của ứng dụng sẽ mở khi shortcut tương ứng được kích hoạt.
        URL phải nằm trong [scope](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) của manifest ứng dụng web.
        Nếu giá trị là tuyệt đối, nó phải cùng origin với trang liên kết tới tệp manifest.
        Nếu giá trị là tương đối, nó được phân giải dựa trên URL của tệp manifest.

    - [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) {{Optional_Inline}}
      - : Một mảng các đối tượng biểu tượng đại diện cho shortcut trong các ngữ cảnh khác nhau.
        Nó có cùng định dạng với member manifest [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons).

## Mô tả

Member `shortcuts` cho phép bạn cung cấp cho người dùng quyền truy cập trực tiếp vào các tính năng quan trọng do ứng dụng web của bạn cung cấp.
Shortcuts thường được trình bày cho người dùng trong menu ngữ cảnh khi họ tương tác với biểu tượng ứng dụng web, chẳng hạn bằng cách nhấp chuột phải hoặc nhấn giữ nó.
Khi người dùng kích hoạt một shortcut từ menu này, trình duyệt sẽ điều hướng họ tới địa chỉ được chỉ định trong `url` của shortcut.

Trình duyệt thường hiển thị các shortcut theo cùng thứ tự như chúng được cung cấp trong tệp manifest của ứng dụng.

> [!NOTE]
> Cách trình bày và số lượng shortcut được hiển thị cho người dùng do trình duyệt và/hoặc hệ điều hành quyết định.
> Ví dụ, trình duyệt có thể cắt bớt danh sách shortcut đã khai báo để phù hợp với quy ước hoặc giới hạn của hệ điều hành máy chủ.

### Lợi ích của việc thêm shortcut

Shortcut có thể nâng cao trải nghiệm người dùng bằng cách:

- Cung cấp điều hướng trực tiếp tới các tính năng hoặc trang được dùng thường xuyên trong ứng dụng web
- Làm cho ứng dụng web của bạn giống một ứng dụng bản địa của nền tảng và quen thuộc hơn với người dùng.

Ví dụ, shortcut có thể được dùng để liên kết trực tiếp tới dòng thời gian của người dùng trong một ứng dụng mạng xã hội hoặc cung cấp quyền truy cập nhanh vào các đơn hàng gần đây của người dùng trong bối cảnh thương mại điện tử.

### Thực hành tốt nhất khi thêm shortcut

Khi tạo shortcut cho ứng dụng web của bạn, hãy ghi nhớ các hướng dẫn sau:

- Giữ tên shortcut ngắn nhưng đủ mô tả để truyền đạt rõ mục đích cho người dùng.
- Bảo đảm URL của shortcut nằm trong scope của ứng dụng web của bạn.
- Bao gồm biểu tượng cho shortcut để cải thiện khả năng nhận diện trực quan.
  Cung cấp biểu tượng ở nhiều kích thước để bảo đảm hiển thị chất lượng trên các thiết bị và ngữ cảnh khác nhau.
- Sắp xếp các shortcut từ quan trọng nhất tới ít quan trọng hơn, dựa trên mức độ liên quan và tần suất sử dụng của các tính năng mà chúng liên kết tới.
- Ưu tiên thêm một vài shortcut quan trọng. Một danh sách dài không chỉ có thể làm người dùng quá tải, mà còn có thể bị một số nền tảng hoặc trình duyệt cắt bớt.

## Ví dụ

### Định nghĩa shortcut cho một ứng dụng web quản lý tác vụ

Hãy xét một ứng dụng quản lý tác vụ. Ví dụ này cho thấy cách thêm hai shortcut. Shortcut "New Task" sẽ đưa người dùng trực tiếp tới trang tạo tác vụ, còn shortcut "Today's Tasks" sẽ cung cấp quyền truy cập nhanh vào danh sách tác vụ của họ cho ngày hiện tại.

```json
{
  "name": "TaskPro",
  "short_name": "Tasks",
  "start_url": "/dashboard",
  "display": "standalone",
  "shortcuts": [
    {
      "name": "New Task",
      "short_name": "Add",
      "description": "Thêm nhanh một tác vụ mới",
      "url": "/tasks/new"
    },
    {
      "name": "Today's Tasks",
      "short_name": "Today",
      "description": "Xem các tác vụ của bạn cho hôm nay",
      "url": "/tasks/today"
    }
  ]
}
```

### Thêm biểu tượng cho shortcut và dùng URL tương đối

Dựa trên ví dụ trước, đoạn mã dưới đây thêm biểu tượng cho hai shortcut và minh họa việc dùng URL tương đối trong shortcut thứ ba bổ sung. URL `../projects` sẽ được phân giải tương đối với URL của manifest ứng dụng. Ví dụ, nếu tệp manifest của ứng dụng nằm tại `/dashboard/manifest.json`, shortcut này sẽ điều hướng tới `/projects`.

```json
{
  "name": "TaskPro",
  "short_name": "Tasks",
  "start_url": "/dashboard",
  "display": "standalone",
  "shortcuts": [
    {
      "name": "New Task",
      "short_name": "Add",
      "description": "Thêm nhanh một tác vụ mới",
      "url": "/tasks/new",
      "icons": [
        {
          "src": "/images/add.png",
          "sizes": "192x192"
        }
      ]
    },
    {
      "name": "Today's Tasks",
      "short_name": "Today",
      "description": "Xem các tác vụ của bạn cho hôm nay",
      "url": "/tasks/today",
      "icons": [
        {
          "src": "/images/calendar.png",
          "sizes": "192x192"
        }
      ]
    },
    {
      "name": "All Projects",
      "short_name": "Projects",
      "description": "Xem tất cả dự án của bạn",
      "url": "../projects"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`icons`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/icons) manifest member
- [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) manifest member
- [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) manifest member
- [Same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- Cách [expose common actions as shortcuts](/en-US/docs/Web/Progressive_web_apps/How_to/Expose_common_actions_as_shortcuts) trong PWA
