import { Permission } from '../models/permissions.enum';

export class PermissionModel {
  url!: RegExp;
  permissions!: Permission[];
}
