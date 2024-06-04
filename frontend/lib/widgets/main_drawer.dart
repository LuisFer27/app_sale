import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 18),
                Text(
                  //'Cooking Up!',
                  'Nombre usuario',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.store,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              //'Meals',
              'Catalogo de productos',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              //onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contacts,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              //'Meals',
              'Lista de usuarios',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              //onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_bag,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              //'Meals',
              'Lista de pedidos',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              //onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.edit,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              //'Meals',
              'Editar usuario',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              //onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              //'Filters',
              'Cerrar sesión',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              // onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
