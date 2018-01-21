# cookie-counter

## Planning

### Features

- Track and update inventory
  - On hand
  - On order
  - Thresholds -- low stock alerts
  - Unit cost/value
  - Wastage
  - Time since last count
- All from a tablet/computer
- Authentication/administration
  - Add/edit/delete items

Maybe:

- Access from anywhere
- History through snapshots
  - Graph
  - dInventory - waste = sales
- Export to Excel
- User accounts?
  - Dropdown login + PIN

### Database Models

**Transactional model:** *Stock = Recieved - Sold - Waste.* Requires accurate tracking of sales/usage/waste. Seems unlikely.

**Count model:** Stock is counted regularly and updated.

- item
  - id
  - in_stock
  - on_order
  - name
  - unit
  - value
  - threshold
  - last_count
  - has_many :categories

- category
  - name
  - has_many :items

Snapshots can be taken every *x* interval (depending on database size and storage capacity) to allow for comparison over time.

Shorter interval snapshots could be stored over a shorter timespan to allow for backup & rollback capacity in case something goes wrong or someone screws up.

### Hosting

### Security