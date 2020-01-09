/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rreedy <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/07/11 17:34:47 by rreedy            #+#    #+#             */
/*   Updated: 2020/01/09 02:57:19 by rreedy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "config.h"
#include "fdf.h"
#include "ft_put.h"
#include "mlx.h"

int		handle_key(int key, void *param)
{
	t_identifiers	*id;

	(void)key;
	id = (t_identifiers *)param;
	mlx_pixel_put(id->connection, id->window, 0, 0, 0x0990000);
	ft_putchar('x');
	return (0);
}

/*
**	The main function of this program initializes the program 
**
**	t_idenfitiers
**	{
**		
**	}
*/

int		main()
{
	struct s_identifiers	ids;

	// initialize connection with mlx [server?]
	ids.connection = mlx_init();
	if (!ids.connection)
		return (0);

	// wait is this the window server?
	ids.window = mlx_new_window(ids.connection, SIZE_X, SIZE_Y, TITLE);
	if (!ids.window)
		return (0);

	// like the signal() function, mlx_key_hook() allows it to catch keys when
	// they come in, allowing them to be handled separately.
	mlx_key_hook(ids.window, handle_key, (void *)&ids);

	// loop is to continuously keep the connection until told otherwise?
	mlx_loop(ids.connection);

	return (0);
}
