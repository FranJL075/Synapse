import {
  Directive,
  EmbeddedViewRef,
  Input,
  OnInit,
  TemplateRef,
  ViewContainerRef,
} from '@angular/core';
import { PermissionService } from '../services/permission-manager.service';
import { Permission } from '../models/permissions.enum';

@Directive({
  selector: '[authPermission]',
})
export class PermissionDirective implements OnInit {
  private _permissionKey!: Permission[];
  private _viewRef: EmbeddedViewRef<any> | null = null;
  private _templateRef: TemplateRef<any> | null = null;

  @Input()
  set authPermission(permission: Permission[]) {
    this._permissionKey = permission;
    this._viewRef = null;
  }

  constructor(
    private templateRef: TemplateRef<any>,
    private viewContainerRef: ViewContainerRef,
    private permission: PermissionService
  ) {}

  ngOnInit(): void {
    this.init();
  }

  init() {
    const isPermitted = this.permission.validatePermissionKey(
      this._permissionKey
    );

    if (!isPermitted) return;

    this.viewContainerRef.createEmbeddedView(this.templateRef);
  }
}
